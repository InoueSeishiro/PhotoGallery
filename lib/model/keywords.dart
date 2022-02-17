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
  }
  late final List<Keyword> keywords;

  void add(Keyword keyword){
    keywords.add(keyword);
    notifyListeners();
  }
  void remove(Keyword keyword){
    if(keywords.contains(keyword)){
      keywords.remove(keyword);
    }
    notifyListeners();
  }
  void clear(){
    keywords.clear();
    notifyListeners();
  }
  List<Keyword> getPathList(){
    return keywords;
  }
  List<String> getPathListWithKeyword(String keyword) {
    return keywords.firstWhere((element) => (element.keyword == keyword)? true: false).imagePathList;
  }

  List<Keyword> getKeywords(String searchWord){
    return keywords.where((element) => (element.keyword.contains(searchWord)? true: false)) as List<Keyword>;
  }
}