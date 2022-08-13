import 'package:base/features/presentation/components/submit_button.dart';
import 'package:base/features/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/user.dart';

class UserInfoCard extends StatelessWidget {
  final User user;
  const UserInfoCard({
    Key? key,
    required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _mainWidget(context);
  }
  Widget _mainWidget(BuildContext context){
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 8, spreadRadius: 1, color: Colors.grey, offset: Offset(1,1) )
        ]
      ),
      child: Row(
        children: [
          // user circle avator
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            child: Text(user.name[0]),
          ),
          SizedBox(width: 8.0,),
          // Name and phone column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(user.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                // SizedBox(height: 8.0,),
                Text(user.phoneNo)
              ],
            ),
          ),
          SubmitButton(callback: (){
            Navigator.pushNamedAndRemoveUntil(context, LoginPage.routeName, (route) => false);
          }, text: "Logout")
          // logout button
        ],
      ),
    );
  }
}
