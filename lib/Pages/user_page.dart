import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/Widgets/account_header.dart';
import 'package:photo_gallery/Widgets/gallery.dart';

import 'package:photo_gallery/Widgets/my_app_bar.dart';
import 'package:photo_gallery/Widgets/user_drawer.dart';

class UserPage extends StatefulWidget{
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();

}
class _UserPageState extends State<UserPage>{
  int _index = 0;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(),
      endDrawer: UserDrawer(),
      body: Row(
        children: [
          NavigationRail(
            groupAlignment: 0.0,
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.account_circle),
                  label: Text("アカウント")
              ),
              NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text("設定")
              ),
            ],
            selectedIndex: _index,
          ),
          const Expanded(
            child: Gallery(urlList: [],),
          ),
        ]
      )
    );
  }
}