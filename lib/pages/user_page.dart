import 'package:flutter/material.dart';
import 'package:photo_gallery/model/keywords.dart';
import 'package:photo_gallery/widgets/gallery.dart';
import 'package:photo_gallery/widgets/right_side_button.dart';
import 'package:photo_gallery/widgets/side_menu.dart';
import 'package:photo_gallery/widgets/center_body.dart';

import 'package:photo_gallery/widgets/user_drawer.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget{
  const UserPage({Key? key}) : super(key: key);
  static const double menuWidth = 200;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MenuIndexNotifier>(
      create: (context) => MenuIndexNotifier(),
      child: Stack(
        children: [
          const SideMenu(
            menuWidth: menuWidth,
            menuList: [
              Text("ホーム"),
              Text("設定"),
            ],
          ),
          buildCenterBody(),
        ]
      ),
    );
  }

  buildCenterBody(){
    return CenterBody(
        menuWidth: menuWidth,
        widgets: const [
          Home(),
          Setting(),
        ]
    );
  }
}

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KeywordNotifier>(
      create: (_) => KeywordNotifier(),
      child: Scaffold(
        endDrawer: UserDrawer(),
        body: Stack(
          children: [
            Gallery(
              urlList: List.generate(22, (int index) => 'https://i.ibb.co/vDvKN2K/tiger.jpg'),
            ),
            const RightSideButton(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.redAccent,
          child: const Icon(Icons.touch_app),
        ),
      ),
    );
  }
}

class Setting extends StatelessWidget{
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left:100,top:30,right:100,bottom:30),
        child: Column(
          children: [
            const Icon(
              Icons.account_circle,
              size: 200,
            ),
            Text("user@example.com", style: TextStyle(fontSize: 20),),
            Spacer(),
            ElevatedButton(
                onPressed: (){},
                child: Text("アカウント編集")
            ),
            Spacer(flex: 5)
          ],
        ),
      ),
    );
  }
}