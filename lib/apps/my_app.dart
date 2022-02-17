import 'package:flutter/material.dart';
import 'package:photo_gallery/auth/guard.dart';
import 'package:photo_gallery/auth/login.dart';
import 'package:photo_gallery/pages/admin_page.dart';

import 'package:photo_gallery/pages/login_page.dart';
import 'package:photo_gallery/pages/user_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : this.info = null, super(key: key);
  MyApp.test({required this.info});

  final UserInfo? info;

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<UserInfoNotifier?>(
      create: (_) => UserInfoNotifier(info),
      child:MaterialApp(
        title: 'PhotoGallery',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.black,
          fontFamily: 'Noto Sans JP',
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => LoginPage(),
          '/user': (_) => Guard(role: Login.user, child:UserPage()),
          '/admin': (_) => Guard(role: Login.admin, child:AdminPage()),
        },
      ),
    );
  }
}