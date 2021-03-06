import 'package:flutter/material.dart';

import 'package:photo_gallery/widgets/account_header.dart';

class AdminDrawer extends StatelessWidget{
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          AccountHeader(),
          ListTile(
              title:  const Text("ユーザー情報編集"),
              onTap: (){
                Navigator.pop(context);
              }
          ),
        ]
      ),
    );
  }
}