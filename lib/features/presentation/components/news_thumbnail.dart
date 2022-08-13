import 'package:base/features/presentation/components/network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/latest_news.dart';

class NewsThumbnail extends StatelessWidget {
  final LatestNews latestNews;
  final VoidCallback callback;
  const NewsThumbnail({
    Key? key,
    required this.latestNews,
    required this.callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      // height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: GestureDetector(
        onTap: callback,
        child: Card(
          child: Row(
            children: [
              Expanded(flex: 2, child: OurNetworkImage(url: latestNews.image,)),
              SizedBox(width: 8.0,),
              Expanded(flex: 3,child: Center(child: Text(latestNews.title),))
            ],
          ),
        ),
      ),
    );
  }
}
