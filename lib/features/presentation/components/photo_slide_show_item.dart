
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoSlideShowItem extends StatelessWidget {
  final String  photo;


  PhotoSlideShowItem({
    Key? key, required this.photo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
        },
        child : ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: photo,
            placeholder: (context, url) => Center(
                child: Container(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator()
                )
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        )
      /*
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(appIconAssets, fit: BoxFit.fill,),
            CircularProgressIndicator(),
            Image.network(promotion?.photo?.name ?? appIconUrl, fit: BoxFit.fill,),
          ],
        )
         */
    );
  }
}
