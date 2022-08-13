import 'package:flutter/material.dart';

import '../../data/const/data.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: Container(
        width: double.infinity,
        child: Image.asset(
          appIconAssets,
          scale: 10.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
