import 'package:flutter/material.dart';

class ImageManager extends StatelessWidget{
  ImageManager({Key? key}): super(key: key);
  final double commandWidth = 60;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Padding(
          padding: EdgeInsets.only(right: commandWidth,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FileView(),
              ImageView(),
            ],
          ),
        ),
        CommandList(width: commandWidth,),
      ],
    );
  }
}

class FileView extends StatelessWidget{
  const FileView({Key? key,});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("File area"));
  }
}
class ImageView extends StatelessWidget{
  const ImageView({Key? key,});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Image area"));
  }
}
class CommandList extends StatelessWidget{
  const CommandList({Key? key, required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommandIcon(icon: Icons.touch_app, size: width,),
          CommandIcon(icon: Icons.download_sharp, size: width,),
          CommandIcon(icon: Icons.upload_sharp, size: width,),
        ],
      )
    );
  }
}

class CommandIcon extends StatelessWidget{
  CommandIcon({Key? key, required this.size, required this.icon}): super(key: key);

  final double size;
  final IconData icon;
  final double padding = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child:SizedBox.square(
        dimension: size - padding*2,
        child: Center(child: Icon(icon, size: size - padding*2),),
      ),
    );
  }
}