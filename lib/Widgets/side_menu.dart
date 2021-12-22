import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget{
  const SideMenu({Key? key, required this.menuWidth,required this.menuList}) : super(key: key);

  final double menuWidth;
  final List<Text> menuList;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: menuWidth,
        child: Column(
          children: [
            SizedBox(height: 64,),
            FlutterLogo(),
            SizedBox(height:16),
            Text("Photo Gallery"),
            const Spacer(),
            for(Text menu in menuList)
              MenuItem(child: menu,),
            const Spacer(),
            MenuItem(child: Text("ログアウト")),
          ],
        ),
      ),
    );
  }

}

class MenuItem extends StatelessWidget{
  const MenuItem({Key? key, required this.child}) : super(key: key);

  final Text child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child:SizedBox(
        height: 70,
        child: child,
      )
    );
  }
}