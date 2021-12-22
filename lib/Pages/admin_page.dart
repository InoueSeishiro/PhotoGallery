import 'package:flutter/material.dart';
import 'package:photo_gallery/Widgets/gallery.dart';
import 'package:photo_gallery/Widgets/left_side_button.dart';

import 'package:photo_gallery/Widgets/my_app_bar.dart';
import 'package:photo_gallery/Widgets/admin_drawer.dart';
import 'package:photo_gallery/Widgets/side_menu.dart';

class AdminPage extends StatelessWidget{
  const AdminPage({Key? key}) : super(key: key);

  get menuWidth => 200;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      endDrawer: AdminDrawer(),
      body: Stack(
        children: [
          SideMenu(menuWidth: menuWidth, menuList: [
            Text("ホーム"),
            Text("アカウント"),
            Text("ユーザー情報編集"),
            Text("設定"),
          ]),
          Gallery(urlList: [],menuWidth: menuWidth,),
        ]
      )
    );
  }
}