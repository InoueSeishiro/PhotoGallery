import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{
  String address = "";
  String password = "";

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "メールアドレス"),
              onChanged: (String value) {
                setState(() {
                  address = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "パスワード"),
              obscureText: true,
              onChanged: (String value) {
                setState(() {
                  password = value;
                });
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  UserCredential result = await auth.signInWithEmailAndPassword(
                    email: address,
                    password: password,
                  );
                  Navigator.pushNamed(context, '/home');
                },
                child: const Text("ログイン"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                ),
            )
          ],
        )
      ),
    );
  }
}
