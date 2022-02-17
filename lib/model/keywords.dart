import 'package:flutter/material.dart';

class Keyword{
  const Keyword({required this.keyword, required this.imagePathList});
  final String keyword;
  final List<String> imagePathList;
  int get count => imagePathList.length;
}

class KeywordNotifier extends ChangeNotifier{
  KeywordNotifier(){
    keywords = [
      const Keyword(
        keyword: "animal",
        imagePathList: [
          "https://i.ibb.co/5MK2H4k/tertle.jpg",
          "https://i.ibb.co/3kYLxtL/tiger.jpg",
        ]
      ),
      const Keyword(
        keyword: "turtle",
        imagePathList:[
          "https://i.ibb.co/5MK2H4k/tertle.jpg",
        ],
      ),
      const Keyword(
        keyword: "tiger",
        imagePathList:[
          "https://i.ibb.co/3kYLxtL/tiger.jpg",
        ],
      ),
    ];
    selectedKeywords = List<String>.empty(growable: true);
  }
  late List<Keyword> keywords;
  late List<String> selectedKeywords;

  void clear(){
    selectedKeywords.clear();
    notifyListeners();
  }
  void select(String keyword){
    if(!selectedKeywords.contains(keyword)) {
      selectedKeywords.add(keyword);
      notifyListeners();
    }
  }
  void unselect(String keyword){
    selectedKeywords.remove(keyword);
    notifyListeners();
  }
  List<String> getPathListWithKeyword(String keyword) {
    return keywords.firstWhere((element) => (element.keyword == keyword)? true: false).imagePathList;
  }

  List<Keyword> getKeywords(String searchWord){
    return keywords.where((element) => (element.keyword.contains(searchWord)? true: false)) as List<Keyword>;
  }
}