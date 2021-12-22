import 'package:flutter/material.dart';
import 'package:photo_gallery/Widgets/gallery.dart';
import 'package:photo_gallery/Widgets/left_side_button.dart';
import 'package:photo_gallery/Widgets/side_menu.dart';

import 'package:photo_gallery/Widgets/user_drawer.dart';

class UserPage extends StatefulWidget{
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}
class _UserPageState extends State<UserPage>{
  int _index = 0;
  static const double menuWidth = 200;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      endDrawer: UserDrawer(),
      body: Stack(
        children: [
          SideMenu(menuWidth: menuWidth, menuList: [
            Text("ホーム"),
            Text("アカウント"),
            Text("設定"),
          ]),
          Gallery(
            urlList: List.generate(22, (int index) => 'https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg'),
            menuWidth: menuWidth,
          ),
          LeftSideButton(),
        ]
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