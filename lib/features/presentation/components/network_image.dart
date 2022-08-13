import 'package:base/features/data/const/data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OurNetworkImage extends StatelessWidget {
  final String url;
  const OurNetworkImage({
    Key? key,
    required this.url
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: url,
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Image.asset(appIconAssets),
      ),
    );
  }
}
