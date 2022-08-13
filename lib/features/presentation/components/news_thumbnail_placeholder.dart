import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsThumbnailPlaceholder extends StatelessWidget {
  const NewsThumbnailPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0)
        ),
        width: double.infinity,
        height: 100,
        //child: Text('img'),
      ),
    );
  }
}
