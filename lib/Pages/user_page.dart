import 'package:flutter/material.dart';
import 'package:photo_gallery/Widgets/account_header.dart';

import 'package:photo_gallery/Widgets/my_app_bar.dart';
import 'package:photo_gallery/Widgets/user_drawer.dart';

class UserPage extends StatelessWidget{
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(),
      endDrawer: UserDrawer(),
      body: const Center(child: Text("User Page")),
    );
  }
}