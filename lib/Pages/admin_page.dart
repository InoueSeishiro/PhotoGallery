import 'package:flutter/material.dart';

import 'package:photo_gallery/WIdgets/myAppBar.dart';

class AdminPage extends StatelessWidget{
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(),
      body: const Center(child: Text("Admin Page")),
    );
  }
}