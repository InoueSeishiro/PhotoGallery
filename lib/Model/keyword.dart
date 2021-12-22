import 'package:firebase_database/firebase_database.dart';

class Keyword{
  const Keyword({required this.keyword, required this.imageIDList}) : count = imageIDList.length;
  final String keyword;
  final List<int> imageIDList;
  final int count;

  static Future<List<Keyword>> getAllKeyword() async {
    List<Keyword> list = List.empty();
    DataSnapshot snapshot = await FirebaseDatabase.instance.ref('keyword').get();
    for(DataSnapshot snp in snapshot.children){
      String word = snp.child("keyword").value as String;
      List<String> idList = (snp.child("IDList").value as String).split(":");
      List<int> idlist_int = List.generate(idList.length, (index) => int.parse(idList[index]));
      list.add(Keyword(keyword: word, imageIDList: idlist_int));
    }
    list.sort((Keyword key1, Keyword key2){
      if(key1.count > key2.count){
        return 1;
      }else{
        return 0;
      }
    });
    return list;
  }
}