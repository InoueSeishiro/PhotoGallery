import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeftSideButton extends StatelessWidget{
  const LeftSideButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: Padding(
        padding: EdgeInsets.only(top: 100),
        child: Material(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(5),
              bottomStart: Radius.circular(5),
            ),
          ),
          elevation: 4,
            child :SizedBox(
              width: 50,
              height: 50,
              child: IconButton(
                icon: Icon(
                    Icons.search,
                ),
              onPressed: (){ Scaffold.of(context).openEndDrawer(); },
            ),
          ),
        ),
      ),
    );
  }
}