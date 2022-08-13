import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/presentation/components/dreamcatcher/user_info_card.dart';
import 'package:base/features/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/submit_button.dart';
import '../login_page.dart';

class BinanceProfilePage extends StatefulWidget {
  static String routeName = "/BinanceProfilePage";
  const BinanceProfilePage({Key? key}) : super(key: key);

  @override
  _BinanceProfilePageState createState() => _BinanceProfilePageState();
}

class _BinanceProfilePageState extends State<BinanceProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: _mainWidget(Provider.of<UserProvider>(context, listen:true).user),
      ),
    );
  }

  Widget _mainWidget(User user){
    return Column(
      children: [
        _balanceCard(user),
      ],
    );
  }
  Widget _balanceCard(User user){
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
                Text(user.balance.toString() + " MMK", style: TextStyle(fontSize: 24),)
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
