import 'package:flutter/material.dart';
import 'package:photo_gallery/Pages/admin_page.dart';
import 'package:photo_gallery/Pages/login_page.dart';
import 'package:photo_gallery/Pages/user_page.dart';

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      MaterialApp(
      title: 'PhotoGallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => LoginPage(),
        '/user' : (context) => UserPage(),
        '/admin' : (context) => AdminPage(),
      },
    );
  }
}