import 'package:flutter/material.dart';
import 'package:photo_gallery/Auth/login.dart';
import 'package:provider/provider.dart';

class AccountHeader extends StatelessWidget{
  const AccountHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String name = Provider.of<UserInfoNotifier>(context, listen: false).info!.name;
    return UserAccountsDrawerHeader(
      accountName: Text(
        name,
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      accountEmail: Text(
        Provider.of<UserInfoNotifier>(context, listen: false).info!.email,
        style: TextStyle(color: Colors.grey, fontSize: 15),
      ),
      currentAccountPicture: CircleAvatar(
        child: Text(
          name[0],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      decoration: BoxDecoration(color: Colors.white)
    );
  }
}