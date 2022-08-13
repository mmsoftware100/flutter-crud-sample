import 'package:base/features/domain/entities/binance/bet_type.dart';
import 'package:base/features/presentation/components/our_text_input.dart';
import 'package:base/features/presentation/components/submit_button.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_confirm_page.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_select_page.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_time_select_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/binance/bet.dart';
import '../../providers/binance_provider.dart';

class BinanceBetTypeSelectPage extends StatefulWidget {
  static String routeName = "/BinanceBetTypeSelectPage";
  const BinanceBetTypeSelectPage({Key? key}) : super(key: key);

  @override
  _BinanceBetTypeSelectPageState createState() => _BinanceBetTypeSelectPageState();
}

class _BinanceBetTypeSelectPageState extends State<BinanceBetTypeSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      /*
      appBar: AppBar(
        title: Text("Enter Amount"),
      ),
       */
      body: _mainWidget(Provider.of<BinanceProvider>(context, listen:true).betTypes),
    );
  }

  Widget _mainWidget(List<BetType> betTypes){
    return Column(
      children: [
        ...List.generate(betTypes.length, (index) => SubmitButton(callback: (){_setType(betTypes[index].id);}, text: betTypes[index].name))
       // ,
        //SubmitButton(callback: (){_setType(2);}, text: "Crypto"),
      ],
    );
  }

  void _setType(int betTypeId){
    // set and go to next page
    print("BinanceBetTypeSelectPage->_setType");

    // go to bet time selection page
    Navigator.pushNamed(context, BinanceBetTimeSelectPage.routeName);
  }

}
