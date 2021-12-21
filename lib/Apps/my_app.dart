import 'package:flutter/material.dart';
import 'package:photo_gallery/Auth/guard.dart';
import 'package:photo_gallery/Auth/login.dart';
import 'package:photo_gallery/Pages/admin_page.dart';

import 'package:photo_gallery/Pages/login_page.dart';
import 'package:photo_gallery/Pages/user_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: read user data from local
    UserInfo? info;

    // DONE: build App
    return ChangeNotifierProvider<UserInfoNotifier?>(
      create: (_) => UserInfoNotifier(info),
      child:MaterialApp(
        title: 'PhotoGallery',
        theme: ThemeData(
          primarySwatch: Colors.blue,
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