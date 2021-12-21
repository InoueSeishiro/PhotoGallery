import 'package:flutter/material.dart';

import 'package:photo_gallery/Auth/login.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  String message = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
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
                controller: emailController,
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
                    try{
                      UserInfo result = await Login.login(emailController.text, passwordController.text);
                      Provider.of<UserInfoNotifier>(context, listen: false).set(result);
                      if(result.role == Login.user){
                        setState(() {
                          emailController.clear();
                          passwordController.clear();
                        });
                        Navigator.pushNamed(context, '/user');
                      }else if(result.role == Login.admin) {
                        setState(() {
                          emailController.clear();
                          passwordController.clear();
                        });
                        Navigator.pushNamed(context, '/admin');
                      }
                    }catch(e){
                      print(e.toString());
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
