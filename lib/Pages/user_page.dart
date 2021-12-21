import 'package:flutter/material.dart';

import 'package:photo_gallery/WIdgets/myAppBar.dart';

class UserPage extends StatelessWidget{
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(),
      drawer: Drawer(

      ),
      body: const Center(child: Text("User Page")),
    );
  }
}