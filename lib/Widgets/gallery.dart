import 'package:flutter/material.dart';

class Gallery extends StatelessWidget{
  const Gallery({Key? key, required this.urlList}) : super(key: key);

  final List<String> urlList;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.only(left: 200,top:10,bottom:10,right: 200),
      crossAxisSpacing: 30,
      mainAxisSpacing: 0,

      children: List.generate(12, (index) {
        return Center(
          child:Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg',
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
        );
      })
    );
  }

}
