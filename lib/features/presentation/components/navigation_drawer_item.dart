import 'package:flutter/material.dart';

class NavigationDrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback callback;

  const NavigationDrawerItem({
    Key? key,
    required this.title,
    required this.callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      child: Card(
        // color: Colors.transparent,
        child: ListTile(
          //leading: Icon(Icons.mobile_screen_share_outlined),
          title: Text(title),
          onTap: callback,
        ),
      ),
    );
  }
}
