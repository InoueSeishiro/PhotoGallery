import 'package:flutter/material.dart';
import 'package:photo_gallery/auth/login.dart';
import 'package:photo_gallery/pages/login_page.dart';
import 'package:provider/provider.dart';

class Guard extends StatelessWidget{
  const Guard({Key? key, required this.role, required this.child}) : super(key:key);

  final int role;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    UserInfo? user = Provider.of<UserInfoNotifier>(context).info;
    if(user == null || user.role != role){
      return LoginPage();
    }else{
      return child;
    }
  }
}