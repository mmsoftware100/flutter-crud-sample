import 'package:base/features/data/themes/spt_theme.dart';
import 'package:flutter/material.dart';

import '../../../core/util/call_back_with_string.dart';

class OurTextInput extends StatelessWidget {
  final String label;
  final String placeHolder;
  final TextEditingController textEditingController;
  final CallBackWithString callback;
  final TextInputType textInputType; // = TextInputType.number;
  final String initial;

  const OurTextInput({
    Key? key,
    required  this.label,
    required  this.placeHolder,
    required  this.textEditingController,
    required this.callback,
    this.textInputType = TextInputType.text,
    this.initial = ""

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: initial,
        keyboardType: textInputType,
        onChanged: callback,
        // controller: textEditingController,
        // style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          // border: OutlineInputBorder(),

            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorWhite)
            ),

            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorWhite)
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorWhite)
            ),

            hintText: placeHolder,
            labelText: label,
            hintStyle: TextStyle(color: colorWhite),
            labelStyle: TextStyle(color: colorWhite),
            fillColor: Colors.white
        ),
      ),
    );
  }
}
