import 'package:flutter/material.dart';

class TextLink extends StatelessWidget {
  final String description;
  final String linkName;
  final String routeName;
  final bool replace;
  const TextLink({
    Key? key,
    required this.description,
    required this.linkName,
    required this.routeName,
    this.replace = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _textLink(context);
  }

  Widget _textLink(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(description),
        InkWell(
          onTap: (){
            if(replace){
              Navigator.pushReplacementNamed(context, routeName);
            }
            else{
              Navigator.pushNamed(context, routeName);
            }
          },
          child: Text(linkName, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
        ),
      ],
    );
  }
}
