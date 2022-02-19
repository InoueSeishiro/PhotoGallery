import 'package:flutter/material.dart';

class KeywordData{
  static const List<String> keywordList = [
    "animal",
    "tiger",
    "turtle",
  ];
  static const List<String> pathList = [
    "https://i.ibb.co/3kYLxtL/tiger.jpg",
    "https://i.ibb.co/5MK2H4k/tertle.jpg",
  ];
  static const Set<Relation> relationSet = <Relation>{
    Relation(keywordID: 0, imageID: 0),
    Relation(keywordID: 0, imageID: 1),
    Relation(keywordID: 1, imageID: 0),
    Relation(keywordID: 2, imageID: 1),
  };

  static Set<int> getPathIDSet(String keyword){
    int keyIndex = keywordList.indexOf(keyword);
    Iterable<Relation> relations = relationSet.where((element)=>(element.keywordID == keyIndex)? true: false);
    Set<int> result = <int>{};
    relations.forEach((element) {
      if(!result.contains(element.imageID)) result.add(element.imageID);
    });
    return result;
  }
  static Set<int> getKeywordIDSet(String path){
    int pathIndex = pathList.indexOf(path);
    List<Relation> relations = relationSet.where((element)=>(element.imageID == pathIndex)? true: false) as List<Relation>;
    Set<int> result = <int>{};
    relations.forEach((element) {
      if(!result.contains(element.keywordID)) result.add(element.keywordID);
    });
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
      pathIDSetList.forEach((key, value) { 
        pathIDSet = pathIDSet.intersection(value);
      });
    }
  }

  List<String> getURLList(){
    return KeywordData.getPathListOfIdSet(pathIDSet);
  }
}