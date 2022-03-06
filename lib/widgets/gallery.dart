import 'package:flutter/material.dart';
import 'package:photo_gallery/model/keyword.dart';
import 'package:provider/provider.dart';

class Gallery extends StatelessWidget{
  const Gallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> urlList = Provider.of<KeywordNotifier>(context).getURLList();
    return GridView.count(
      crossAxisCount: 4,
      padding: const EdgeInsets.only(left: 50,top:10,bottom:10,right: 50),
      crossAxisSpacing: 30,
      mainAxisSpacing: 30,

      children: List.generate(
        urlList.length,
        (index) => Center(
          child:Image.network(urlList[index],
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                ),
              );
            },
          )
        ),
      ),
    );
  }
}
