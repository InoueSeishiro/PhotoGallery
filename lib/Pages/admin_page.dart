import 'package:flutter/material.dart';

import 'package:photo_gallery/Widgets/my_app_bar.dart';
import 'package:photo_gallery/Widgets/admin_drawer.dart';

class AdminPage extends StatelessWidget{
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(),
      endDrawer: AdminDrawer(),
      body: const Center(child: Text("Admin Page")),
    );
  }
}