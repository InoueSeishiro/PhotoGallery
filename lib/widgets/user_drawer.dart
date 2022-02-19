import 'package:flutter/material.dart';
import 'package:photo_gallery/model/keywords.dart';
import 'package:provider/provider.dart';

class UserDrawer extends StatelessWidget {
  UserDrawer({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    KeywordNotifier notifier = Provider.of<KeywordNotifier>(context);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            buildSearchBox(context),
            const Divider(),
            buildSelectedKeywordArea(context, notifier.selectedKeywords),
            const Divider(),
            buildKeywordArea(context, notifier.availableKeywords),
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
              Provider.of<KeywordNotifier>(context, listen: false).select(keyword);
              controller.clear();
            }
          ),
        ),
      ]
    );
  }

  Widget buildSelectedKeywordArea(BuildContext context, Set<String> selectedKeywords){
    if(selectedKeywords.isEmpty){
      return const Text("No keyword");
    }else{
      return Column(
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              selectedKeywords.length,
              (index) => KeywordButton(title: selectedKeywords.elementAt(index), selected: true,),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:10,),
            child: ElevatedButton(
              onPressed: (){
                Provider.of<KeywordNotifier>(context,listen: false).clear();
              },
              child: Text("リセット"),
            ),
          ),
        ],
      );
    }
  }

  Widget buildKeywordArea(BuildContext context, Set<String> keywords){
    if(keywords.isEmpty){
      return const Text("No keyword");
    }else{
      return Wrap(
        alignment: WrapAlignment.start,
        spacing: 10,
        runSpacing: 10,
        children: List.generate(
          keywords.length,
              (index) => KeywordButton(title: keywords.elementAt(index), selected: false),
        ),
      );
    }
  }
}

class KeywordButton extends StatelessWidget{
  const KeywordButton({Key? key, required this.title, required this.selected}): super(key: key);
  final String title;
  final bool selected;
  static const double fontSize = 15;

  @override
  Widget build(BuildContext context) {
    KeywordNotifier notifier = Provider.of<KeywordNotifier>(context, listen: false);
    if(!selected) {
      return OutlinedButton(
        onPressed: () {
          notifier.select(title);
        },
        child: Text(title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: fontSize,
          ),
        ),
      );
    }else{
      return OutlinedButton(
        onPressed: () {
          notifier.unselect(title);
        },
        child: FittedBox(
          clipBehavior: Clip.none,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.clear, color: Colors.black38, size: 20,),
              Text(title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}