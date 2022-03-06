import 'package:flutter/material.dart';
import 'package:photo_gallery/auth/login.dart';
import 'package:photo_gallery/model/GalleryMode.dart';
import 'package:photo_gallery/model/keyword.dart';
import 'package:photo_gallery/widgets/download_mode_button.dart';
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
    return const CenterBody(
        menuWidth: menuWidth,
        widgets: [
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => KeywordNotifier()),
        ChangeNotifierProvider(create: (_) => GalleryModeNotifier(mode: GalleryMode.normal()),)
      ],
      child: Scaffold(
        endDrawer: UserDrawer(),
        body: Stack(
          children: const [
            Gallery(),
            RightSideButton(),
          ],
        ),
        floatingActionButton: const DownloadModeButton(),
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
            Text(Provider.of<UserInfoNotifier>(context).info?.email as String, style: const TextStyle(fontSize: 20),),
            const Spacer(),
            ElevatedButton(
                onPressed: (){},
                child: const Text("アカウント編集")
            ),
            const Spacer(flex: 5)
          ],
        ),
      ),
    );
  }
}