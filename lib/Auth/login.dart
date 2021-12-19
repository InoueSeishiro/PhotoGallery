import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Login{
  static const int error = -1;
  static const int user = 0;
  static const int admin = 1;

  static Future<int> login(String address, String password) async{
    try {
      UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: address,
        password: password,
      );

      String? uid = result.user?.uid;
      DatabaseReference ref = FirebaseDatabase.instance.ref("users/" + uid!);
      DataSnapshot snapshot = await ref.get();
      if(snapshot.hasChild("role")){
        return snapshot.child("role").value as int;
      }else{
        ref.set({
          "name" : "Default",
          "role" : user
        });
        return user;
      }
    }catch(e){
      print(e.toString());
      return error;
    }
  }
}