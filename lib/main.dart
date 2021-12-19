import 'package:flutter/material.dart';
import 'package:photo_gallery/Views/login.dart';
import 'package:photo_gallery/Views/user.dart';
import 'package:photo_gallery/Views/admin.dart';

import 'package:photo_gallery/Firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhotoGallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      routes: {
        '/user' : (context) => UserPage(),
        '/admin' : (context) => AdminPage(),
      },
    );
  }
}
