import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget{
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("PhotoGallery"),),
      body: const Center(child: Text("Admin Page")),
    );
  }
}