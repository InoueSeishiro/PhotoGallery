import 'package:flutter/material.dart';
import 'package:photo_gallery/auth/login.dart';
import 'package:provider/provider.dart';

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
            const SizedBox(height: 64,),
            const FlutterLogo(),
            const SizedBox(height:16),
            const Text("Photo Gallery"),
            const Spacer(),
            for(int i = 0; i<menuList.length; i++)
              MenuItem(
                child: menuList[i],
                onTap: () {
                  Provider.of<MenuIndexNotifier>(context, listen: false).change(i);
                }
              ),
            const Spacer(),
            MenuItem(
              child: const Text("ログアウト"),
              onTap: () {
                Provider.of<UserInfoNotifier>(context, listen: false).logout();
              }
            ),
          ],
        ),
      ),
    );
  }

}

class MenuItem extends StatelessWidget{
  const MenuItem({Key? key, required this.child, this.onTap}) : super(key: key);

  final Text child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? (){},
      child:SizedBox(
        height: 70,
        child: child,
      )
    );
  }
}

class MenuIndexNotifier extends ChangeNotifier{
  int index = 0;
  void change(int newIndex){
    index = newIndex;
    notifyListeners();
  }
}