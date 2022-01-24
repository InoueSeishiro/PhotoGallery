import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Login{
  static const int error = -1;
  static const int user = 0;
  static const int admin = 1;

  static Future<UserInfo> login(String email, String password) async{
    String name;
    int role;
    try {
      UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String? uid = result.user?.uid;
      DatabaseReference ref = FirebaseDatabase.instance.ref("users/" + uid!);
      DataSnapshot snapshot = await ref.get();
      if(snapshot.hasChild("role")){
        name = snapshot.child("name").value as String;
        role = snapshot.child("role").value as int;
      }else {
        name = "Default";
        role = user;
        ref.set({
          "name": name,
          "role": role
        });
      }
    }catch(e){
      rethrow;
    }
    return UserInfo(name,email,role);
  }
}

class UserInfoNotifier extends ChangeNotifier{
  UserInfoNotifier(this.info);
  UserInfo? info;

  void set(UserInfo newInfo){
    info = newInfo;
    notifyListeners();
  }
  void logout(){
    info = null;
    notifyListeners();
  }
}
class UserInfo{
  UserInfo(this.name, this.email, this.role);
  final String name;
  final String email;
  final int role;
}