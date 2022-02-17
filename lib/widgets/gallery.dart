import 'package:flutter/material.dart';

class Gallery extends StatelessWidget{
  const Gallery({Key? key, required this.urlList}) : super(key: key);

  final List<String> urlList;
  @override
  Widget build(BuildContext context) {
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
