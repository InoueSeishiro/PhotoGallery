import 'package:flutter/material.dart';

class GalleryMode{
  GalleryMode(this.mode);
  static GalleryMode normal(){
    return GalleryMode(true);
  }
  static GalleryMode download(){
    return GalleryMode(false);
  }
  bool mode;
  void change(){
    mode = !mode;
  }
}

class GalleryModeNotifier extends ChangeNotifier{
  GalleryModeNotifier({required this.mode});
  GalleryMode mode;
  void change(){
    mode.change();
    notifyListeners();
  }
}