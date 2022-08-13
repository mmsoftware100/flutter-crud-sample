import 'package:base/features/presentation/components/our_text_input.dart';
import 'package:base/features/presentation/components/submit_button.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_confirm_page.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_select_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/binance/bet.dart';
import '../../../domain/entities/binance/bet_time.dart';
import '../../providers/binance_provider.dart';

class BinanceBetTimeSelectPage extends StatefulWidget {
  static String routeName = "/BinanceBetTimeSelectPage";
  const BinanceBetTimeSelectPage({Key? key}) : super(key: key);

  @override
  _BinanceBetTimeSelectPageState createState() => _BinanceBetTimeSelectPageState();
}

class _BinanceBetTimeSelectPageState extends State<BinanceBetTimeSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Select Time"),
      ),

      body: _mainWidget(Provider.of<BinanceProvider>(context, listen: true).currentAvailableBetTimes()),
    );
  }

  Widget _mainWidget(List<BetTime> betTimes){
    return Column(
      children: List.generate(betTimes.length, (index) => SubmitButton(callback: (){ _setTime(betTimes[index]);}, text: betTimes[index].time)),
    );
  }

  void _setTime(BetTime betTime){
    // set bet time to current bet repo
    // go to bet selection page
    Provider.of<BinanceProvider>(context, listen: false).setBetTime(betTime);
    Navigator.pushNamed(context, BinanceBetSelectPage.routeName);
  }
}
