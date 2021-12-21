import 'package:flutter/material.dart';

import 'Widgets/admin_drawer.dart';
import 'Widgets/my_app_bar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const TestApp());
}

class TestApp extends StatelessWidget{
  const TestApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Test",
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'Noto Sans JP',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(),
      endDrawer: AdminDrawer(),
      body: const Center(child: Text("test screen")),
    );
  }
}