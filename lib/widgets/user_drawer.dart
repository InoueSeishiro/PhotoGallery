import 'package:flutter/material.dart';
import 'package:photo_gallery/model/keywords.dart';
import 'package:provider/provider.dart';

class UserDrawer extends StatefulWidget {
  UserDrawer({Key? key}) : super(key: key);

  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer>{
  late final TextEditingController controller;
  late List<String> pathList;
  
  @override
  void initState() {
    controller = TextEditingController();
    pathList = List<String>.empty();
    super.initState();
  }
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    List<Keyword> keywords = Provider.of<KeywordNotifier>(context).getPathList();
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            buildSearchBox(context),
            for(Keyword keyword in keywords)
              KeywordButton(keyword: keyword),
          ],
        ),
      ),
    );
  }

  Widget buildSearchBox(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Icon(Icons.search, size: 30,),
        SizedBox(
          width: 150,
          height: 40,
          child: TextField(
            controller: controller,
            onSubmitted: (keyword) {
              setState(() {
                pathList = Provider.of<KeywordNotifier>(context).getPathListWithKeyword(keyword);
              });
            }
          ),
        ),
      ]
    );
  }
}

class KeywordButton extends StatelessWidget{
  const KeywordButton({Key? key, required this.keyword}): super(key: key);
  final Keyword keyword;
  static const double fontSize = 15;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {  },
      child:  Text(
        keyword.keyword,
        style: const TextStyle(
          color: Colors.black,
          fontSize: fontSize,
        ),
      ),
    );
  }
}