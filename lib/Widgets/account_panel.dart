import 'package:flutter/material.dart';
import 'package:photo_gallery/Auth/login.dart';
import 'package:provider/provider.dart';

class AccountPanel extends StatelessWidget{
  const AccountPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const Icon(
          Icons.account_circle,
          color: Colors.black,
          size: 100,
        ),
        Text(
          Provider.of<UserInfoNotifier>(context, listen: false).info!.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]
    );
  }
}