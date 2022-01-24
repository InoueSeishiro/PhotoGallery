import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget{
  @override
  final Size preferredSize;

  MyAppBar({Key? key}) : preferredSize = const Size.fromHeight(50.0), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("PhotoGallery"),
      actions: [
        Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () { Scaffold.of(context).openEndDrawer(); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ],
      centerTitle: true,
    );
  }
}