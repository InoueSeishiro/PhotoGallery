import 'package:flutter/material.dart';

import 'Apps/start_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const StartApp());
}