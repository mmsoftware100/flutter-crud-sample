import 'package:base/core/util/alert_dialog.dart';
import 'package:base/features/data/themes/spt_theme.dart';
import 'package:base/features/presentation/components/our_text_input.dart';
import 'package:base/features/presentation/components/submit_button.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_amount_page.dart';
import 'package:base/features/presentation/pages/binance/quick_select_page.dart';
import 'package:base/features/presentation/providers/binance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/const/data.dart';
import '../../../domain/entities/binance/bet.dart';

class BinanceBetSelectPage extends StatefulWidget {
  static String routeName = "/BinanceBetSelectPage";
  const BinanceBetSelectPage({Key? key}) : super(key: key);

  @override
  _BinanceBetSelectPageState createState() => _BinanceBetSelectPageState();
}

class _BinanceBetSelectPageState extends State<BinanceBetSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Select Bet"),
      ),

      body: _mainWidget(Provider.of<BinanceProvider>(context, listen:true).currentIntake.bets),
    );
    // return _mainWidget(Provider.of<BinanceProvider>(context, listen:true).currentBetsRepo);
  }
  
  Widget _mainWidget(List<Bet> betsList){
    return Column(
      children: [
        // Quick Select and bet amount
        _quickSelect(),
        // main selection table
        SubmitButton(callback: (){
          Provider.of<BinanceProvider>(context, listen: false).makeReverse();
        }, text: " R "),
        Expanded(
          child: _mainSelectionTable(),
        ),
        // checkout info
        _checkoutInfo()
      ],
    );
  }

  Widget _mainSelectionTable(){
    return GridView.count(
      physics: BouncingScrollPhysics(),
      crossAxisCount: 5,
      // currently we don't need to set
      children: List.generate(100, (index) => _digitCard(
          Bet(digit: index, amount: minBetAmount),
          Provider.of<BinanceProvider>(context, listen: false).selectedBet(Bet(digit: index, amount: minBetAmount))
      ),),
    );
  }
  Widget _digitCard(Bet bet, bool selected){
    return InkWell(
      onTap: (){
        print("_digitCard->onTap for ${bet.digit}");
        if(selected){
          Provider.of<BinanceProvider>(context, listen: false).removeBet(bet);
        }
        else{
          Provider.of<BinanceProvider>(context, listen: false).addBet(bet);
        }
      },
      // INK to get ripple effect
      child: Ink(
        color: selected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.surface,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: selected ? Colors.white : Theme.of(context).colorScheme.onPrimary),
            // color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(bet.digitFormated, style: TextStyle(color: selected ? Colors.white : Theme.of(context).colorScheme.onPrimary ),),
          ),
        ),
      ),
    );
  }

  Widget _quickSelect(){
    return Container(
      decoration: BoxDecoration(
        // color: colorWhite
      ),
      child: Row(
        children: [
          Expanded(
              child: SubmitButton(
              callback: (){
                // open full screen dialog
                OurAlertDialog.fullScreen(context, QuickSelectPage());
              },
              text: "Quick Select",
            )
          ),
          Expanded(
              child: OurTextInput(
              label: "Amount", callback: _onAmountChange, textEditingController: TextEditingController(), placeHolder: 'min amount 100 MMK',
            )
          )
        ],
      ),
    );
  }
  Widget _checkoutInfo(){
    return Container(
      padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      color: Colors.white,
      child: Row(
        children: [
          // Number of Ticket
          Expanded(
              child: Text(Provider.of<BinanceProvider>(context,listen: true).currentIntakeInfo)
          ),
          // Add amount Button
          Provider.of<BinanceProvider>(context,listen: true).currentIntake.bets.isEmpty ? Container() :
          SubmitButton(callback: (){
            Navigator.pushNamed(context, BinanceBetAmountPage.routeName);
          }, text: "Next")
        ],
      ),
    );
  }

  void _onAmountChange(String? str){
    print("BinanceBetSelectPage->_onAmountChange");
    print(str);
    int amount = int.tryParse(str ?? minBetAmount.toString()) ?? minBetAmount;
    Provider.of<BinanceProvider>(context,listen: false).onAmountChange(amount);
  }
}
