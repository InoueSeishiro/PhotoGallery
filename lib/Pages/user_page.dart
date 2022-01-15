import 'package:flutter/material.dart';
import 'package:photo_gallery/Widgets/gallery.dart';
import 'package:photo_gallery/Widgets/right_side_button.dart';
import 'package:photo_gallery/Widgets/side_menu.dart';
import 'package:photo_gallery/Widgets/center_body.dart';

import 'package:photo_gallery/Widgets/user_drawer.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget{
  UserPage({Key? key}) : super(key: key);
  static const double menuWidth = 200;
  final CenterBody centerBody = CenterBody(
    menuWidth: menuWidth,
    widgets: [
      Home(),
      Account(),
      Setting(),
    ]
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      endDrawer: UserDrawer(),
      body: ChangeNotifierProvider<MenuIndexNotifier>(
        create: (context) => MenuIndexNotifier(),
        child: Stack(
          children: [
            SideMenu(
              menuWidth: menuWidth,
              menuList: [
                Text("ホーム"),
                Text("アカウント"),
                Text("設定"),
              ],
            ),
            centerBody,
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.touch_app),
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

class Setting extends StatelessWidget{
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}