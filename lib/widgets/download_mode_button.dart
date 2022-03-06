import 'package:flutter/material.dart';
import 'package:photo_gallery/model/GalleryMode.dart';
import 'package:provider/provider.dart';

class DownloadModeButton extends StatelessWidget{
  const DownloadModeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Provider.of<GalleryModeNotifier>(context, listen: false).change();
      },
      backgroundColor: Colors.redAccent,
      child: const Icon(Icons.touch_app),
    );
  }
}