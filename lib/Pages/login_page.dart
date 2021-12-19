import 'package:flutter/material.dart';

import 'package:photo_gallery/Auth/login.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  String message = "";
  final addressController = TextEditingController();
  final passwordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose(){
    addressController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "メールアドレス"),
                controller: addressController,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "パスワード"),
                controller: passwordController,
                obscureText: true,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  message,
                  style: TextStyle(color: Colors.red, fontSize: 10),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () async {
                    int status = await Login.login(addressController.text, passwordController.text);
                    if(status == Login.user){
                      setState(() {
                        addressController.clear();
                        passwordController.clear();
                      });
                      Navigator.pushNamed(context, '/user');
                    }else if(status == Login.admin){
                      setState(() {
                        addressController.clear();
                        passwordController.clear();
                      });
                      Navigator.pushNamed(context, '/admin');
                    }else{
                      setState(() {
                        message = "ログインに失敗しました。";
                      });
                    }
                  },
                  child: const Text("ログイン"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                  ),
                )
              )
            ],
          )
        )
      ),
    );
  }
}
