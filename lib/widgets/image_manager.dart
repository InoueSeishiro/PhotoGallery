import 'package:flutter/material.dart';

class ImageManager extends StatelessWidget{
  const ImageManager({Key? key}): super(key: key);
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
            children: const [
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
  const FileView({Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("File area"));
  }
}
class ImageView extends StatelessWidget{
  const ImageView({Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Image area"));
  }
}
class CommandList extends StatelessWidget{
  const CommandList({Key? key, required this.width}): super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      child: Container(
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
      ),
    );
  }
}

class CommandIcon extends StatefulWidget {
  const CommandIcon({Key? key, required this.size, required this.icon}): super(key: key);
  final double size;
  final IconData icon;
  final double padding = 5;

  @override
  _CommandIconState createState() => _CommandIconState();
}
class _CommandIconState extends State<CommandIcon>{
  late Color _color;
  late bool _isTapped;

  @override
  void initState(){
    super.initState();
    _color = Colors.transparent;
    _isTapped = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.padding),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: _color,
          ),
          width: widget.size - widget.padding*4,
          height: widget.size - widget.padding*4,
          alignment: Alignment.center,
          child: Icon(widget.icon, size: widget.size - widget.padding*4),
        ),
        onTap: (){
          setState(() {
            if(_isTapped){
              _color = Colors.transparent;
            }else{
              _color = Colors.black26;
            }
            _isTapped = !_isTapped;
          });
        },
      ),
    );
  }
}