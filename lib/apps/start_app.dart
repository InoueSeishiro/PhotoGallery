import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/firebase/firebase_options.dart';
import 'package:photo_gallery/apps/my_app.dart';

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return const Center(child: Text("Error occurred"));
          }else if(snapshot.connectionState == ConnectionState.done){
            return const MyApp();
          }else{
            return const Center(child:CircularProgressIndicator());
          }
        }
    );
  }
}
