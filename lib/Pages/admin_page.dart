import 'package:flutter/material.dart';
import 'package:photo_gallery/Widgets/center_body.dart';
import 'package:photo_gallery/Widgets/gallery.dart';
import 'package:photo_gallery/Widgets/right_side_button.dart';

import 'package:photo_gallery/Widgets/my_app_bar.dart';
import 'package:photo_gallery/Widgets/admin_drawer.dart';
import 'package:photo_gallery/Widgets/side_menu.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatelessWidget{
  AdminPage({Key? key}) : super(key: key);

  static const double menuWidth = 200;
  final CenterBody centerBody = CenterBody(
    menuWidth: menuWidth,
    widgets: [
      Home(),
      Account(),
      UserInfoEdit(),
      Setting(),
    ]
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      endDrawer: AdminDrawer(),
      body: ChangeNotifierProvider<MenuIndexNotifier>(
        create: (context) => MenuIndexNotifier(),
        child: Stack(
          children: [
            SideMenu(
              menuWidth: menuWidth,
              menuList: [
                Text("ホーム"),
                Text("アカウント"),
                Text("ユーザー情報編集"),
                Text("設定"),
              ]
            ),
            centerBody,
          ]
        ),
      ),
    );
  }
}

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Gallery(
          urlList: List.generate(22, (int index) => 'https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg'),
        ),
        RightSideButton(),
      ],
    );
  }
}

class Account extends StatelessWidget{
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}
class UserInfoEdit extends StatelessWidget{
  const UserInfoEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}
class Setting extends StatelessWidget{
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}