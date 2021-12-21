import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget{
  @override
  final Size preferredSize;

  MyAppBar({Key? key}) : preferredSize = const Size.fromHeight(50.0), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => {

        },
      ),
      title: const Text("PhotoGallery"),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () => {

          },
        ),
      ],
    );
  }
}