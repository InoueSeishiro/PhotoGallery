import 'package:flutter/material.dart';

import 'account_header.dart';

class UserDrawer extends StatelessWidget{
  const UserDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AccountHeader(),
          ListTile(
              title:  const Text("ユーザー設定"),
              onTap: (){
                Navigator.pop(context);
              }
          ),
          ListTile(
            title:  const Text("お気に入り"),
            onTap: (){
              Navigator.pop(context);
            }
          )
        ]
      ),
    );
  }
}