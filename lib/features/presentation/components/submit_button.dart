import 'package:flutter/material.dart';

import '../../data/themes/spt_theme.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback  callback;
  final String text;

  const SubmitButton({
    Key? key,
    required this.callback,
    required this.text
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(spreadRadius: 1.0, blurRadius: 0.0, color: Colors.grey, offset: Offset(0,0))
            ]
        ),
        child: Center(child: Text(text, style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}
