import 'package:flutter/material.dart';

class FullScreen{

  static void fullScreen(BuildContext context, Widget widget, bool dismissible){
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black12.withOpacity(0.6), // Background color
      barrierDismissible: dismissible,
      barrierLabel: 'Dialog',
      transitionDuration: Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return widget;
      },
    );
  }
}