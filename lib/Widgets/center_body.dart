import 'package:flutter/material.dart';
import 'package:photo_gallery/Widgets/side_menu.dart';
import 'package:provider/provider.dart';

class CenterBody extends StatelessWidget {
  CenterBody({Key? key, required this.menuWidth, required this.widgets}) : super(key: key);

  final double menuWidth;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    int index = Provider.of<MenuIndexNotifier>(context).index;
    return Padding(
      padding: EdgeInsets.only(left: menuWidth),
      child: Material(
        elevation: 16,
        child:widgets[index]
      )
    );
  }
}