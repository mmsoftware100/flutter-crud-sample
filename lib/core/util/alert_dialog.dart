import 'package:flutter/material.dart';

class OurAlertDialog{

  static void show(BuildContext context){
    showDialog(
        context: context,
        builder: (_) => WillPopScope(
          onWillPop: () async => true,
          child: SimpleDialog(
            title: Text("You need to login!"),
            //backgroundColor: Colors.transparent,
            //title: Container(height: 50, width: 50, child: _spinKit()),
            //content: _spinKit(),
            children: [
              Text("to add this goods to your cart, you need to login first")
              ],
          ),
        )
    );
  }

  static void fullScreen(BuildContext context, Widget widget){
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black12.withOpacity(0.6), // Background color
      barrierDismissible: false,
      barrierLabel: 'Dialog',
      transitionDuration: Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return widget;
      },
    );
  }
}