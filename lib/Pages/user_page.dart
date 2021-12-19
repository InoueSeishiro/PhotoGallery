import 'package:flutter/material.dart';

class UserPage extends StatelessWidget{
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("PhotoGallery"),),
      body: const Center(child: Text("User Page")),
    );
  }
}