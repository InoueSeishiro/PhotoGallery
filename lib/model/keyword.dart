import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class KeywordData{
  static bool state = false;
  static late List<String> keywordList = List.empty(growable: true);
  static late List<String> pathList = List.empty(growable: true);
  static late Set<Relation> relationSet = <Relation>{};

  static Future<bool> init() async{
    DataSnapshot snapshot = await FirebaseDatabase.instance.ref("keywordData").get();
    for(DataSnapshot childNode in snapshot.children){
      String? imagePath = childNode.child("imagePath").value as String?;
      int pathID;
      int keywordID;
      if(imagePath != null) {
        if (pathList.contains(imagePath)) {
          pathID = pathList.indexOf(imagePath);
        } else {
          pathID = pathList.length;
          pathList.add(imagePath);
        }
        for (DataSnapshot dchildNode in childNode.child("keywords").children) {
          String? keyword = dchildNode.value as String?;
          if(keyword != null) {
            if (keywordList.contains(keyword)) {
              keywordID = keywordList.indexOf(keyword);
            } else {
              keywordID = keywordList.length;
              keywordList.add(keyword);
            }
            relationSet.add(Relation(imageID: pathID, keywordID: keywordID));
          }
        }
      }
    }
    state = true;
    return state;
  }

  static Set<int> getPathIDSet(String keyword){
    int keyIndex = keywordList.indexOf(keyword);
    Iterable<Relation> relations = relationSet.where((element)=>(element.keywordID == keyIndex)? true: false);
    Set<int> result = <int>{};
    for(Relation rel in relations){
      if(!result.contains(rel.imageID)){
        result.add(rel.imageID);
      }
    }
    return result;
  }
  static Set<int> getKeywordIDSet(String path){
    int pathIndex = pathList.indexOf(path);
    List<Relation> relations = relationSet.where((element)=>(element.imageID == pathIndex)? true: false) as List<Relation>;
    Set<int> result = <int>{};
    for(Relation rel in relations){
      if(!result.contains(rel.keywordID)) result.add(rel.keywordID);
    }
    return result;
  }
  static List<String> getPathList(String keyword){
    int keyIndex = keywordList.indexOf(keyword);
    List<Relation> relations = relationSet.where((element)=>(element.keywordID == keyIndex)? true: false) as List<Relation>;
    return List.generate(relations.length, (index) => pathList.elementAt(relations.elementAt(index).imageID));
  }
  static List<String> getPathListOfIdSet(Set<int> pathIDSet){
    return List.generate(pathIDSet.length, (index) => pathList.elementAt(pathIDSet.elementAt(index)));
  }
  static List<String> getKeywordList(String imagePath){
    int pathIndex = pathList.indexOf(imagePath);
    Iterable<Relation> relations = relationSet.where((element)=>(element.imageID == pathIndex)? true: false);
    return List.generate(relations.length, (index) => keywordList.elementAt(relations.elementAt(index).keywordID));
  }
  static Set<String> getAvailableKeywordSet(Set<int> pathIDSet){
    Set<String> result = <String>{};
    for(int id in pathIDSet){
      String path = pathList.elementAt(id);
      Set<String> possibleKeywords = getKeywordList(path).toSet();
      result = result.union(possibleKeywords);
    }
    return result;
  }
}

class Relation{
  const Relation({required this.imageID, required this.keywordID});
  final int imageID;
  final int keywordID;
}

class KeywordNotifier extends ChangeNotifier{
  KeywordNotifier():
    selectedKeywords = <String>{},
    availableKeywords = KeywordData.keywordList.toSet(),
    pathIDSetList = <String, Set<int>>{},
    pathIDSet = <int>{}
  {
    reloadPathIDSet();
  }

  Set<String> selectedKeywords;
  Set<String> availableKeywords;
  
  Map<String, Set<int>> pathIDSetList;
  Set<int> pathIDSet;

  void clear(){
    selectedKeywords.clear();
    availableKeywords = KeywordData.keywordList.toSet();
    pathIDSetList = <String, Set<int>>{};
    reloadPathIDSet();
    notifyListeners();
  }
  void select(String keyword){
    if(!selectedKeywords.contains(keyword)) {
      selectedKeywords.add(keyword);
      pathIDSetList[keyword] = KeywordData.getPathIDSet(keyword);
      pathIDSet = pathIDSet.intersection(pathIDSetList[keyword]!);
      availableKeywords = KeywordData.getAvailableKeywordSet(pathIDSet);
      for(String word in selectedKeywords){
        if(availableKeywords.contains(word)){
          availableKeywords.remove(word);
        }
      }
      notifyListeners();
    }
  }
  void unselect(String keyword){
    selectedKeywords.remove(keyword);
    if(selectedKeywords.isEmpty){
      availableKeywords = KeywordData.keywordList.toSet();
      pathIDSetList.clear();
      reloadPathIDSet();
    }else{
      pathIDSetList.remove(keyword);
      reloadPathIDSet();
      availableKeywords = KeywordData.getAvailableKeywordSet(pathIDSet).difference(selectedKeywords);
    }
    notifyListeners();
  }
  void reloadPathIDSet(){
    if(pathIDSetList.isEmpty){
      pathIDSet.addAll(List.generate(KeywordData.pathList.length, (index) => index));
    }else{
      pathIDSet = pathIDSetList.values.first;
      pathIDSetList.forEach((key, value) { 
        pathIDSet = pathIDSet.intersection(value);
      });
    }
  }
  void reload(){
    availableKeywords = KeywordData.keywordList.toSet();
    reloadPathIDSet();
  }
  List<String> getURLList(){
    return KeywordData.getPathListOfIdSet(pathIDSet);
  }
}