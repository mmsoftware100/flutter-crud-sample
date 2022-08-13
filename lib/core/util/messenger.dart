import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OurMessenger{
  static void showUp(BuildContext context,String message){
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
      /*
      action: SnackBarAction(
        label: 'OK',
        onPressed: () { },
      ),

       */
    ));
  }
}