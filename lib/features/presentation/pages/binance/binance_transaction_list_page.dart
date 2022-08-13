import 'package:base/features/domain/entities/binance/transaction.dart';
import 'package:base/features/presentation/components/our_text_input.dart';
import 'package:base/features/presentation/components/submit_button.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_confirm_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/binance/bet.dart';
import '../../../domain/entities/binance/intake.dart';
import '../../providers/binance_provider.dart';

class BinanceTransactionListPage extends StatefulWidget {
  static String routeName = "/BinanceTransactionListPage";
  const BinanceTransactionListPage({Key? key}) : super(key: key);

  @override
  _BinanceTransactionListPageState createState() => _BinanceTransactionListPageState();
}

class _BinanceTransactionListPageState extends State<BinanceTransactionListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      /*
      appBar: AppBar(
        title: Text("Enter Amount"),
      ),

       */
      body: SingleChildScrollView(child: _mainWidget(Provider.of<BinanceProvider>(context, listen:true).transactionList)),
    );
  }

  Widget _mainWidget(List<Transaction> transactionList){
    return Column(
      children: [
        ...List.generate(transactionList.length, (index) => _transactionCard(transactionList[index]))
      ],
    );
  }

  Widget _transactionCard(Transaction transaction){
    return Container(
      padding : EdgeInsets.all(8.0),
      margin : EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 1.0, spreadRadius: 1.0)
        ]
      ),
      child: Row(
        children: [
          Icon(Icons.monetization_on),
          SizedBox(width: 8.0,),
          Expanded(
            flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(transaction.ops),
                  Text(transaction.date.toString())
                ],
              )
          ),
          Expanded(child: Text(transaction.amount.toString(), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),))
        ],
      ),
    );
  }

  Widget _intakeCard(Intake intake){
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.white
            ],
          ),
          boxShadow: [
            BoxShadow(color: Colors.black26, spreadRadius: 0.0, blurRadius: 1.0)
          ]
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(intake.date + " | "+intake.time, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
              Expanded(child: Text(intake.betType.name, textAlign: TextAlign.right,)),
            ],
          ),
          ...List.generate(intake.bets.length, (index) => ListTile(
            leading: CircleAvatar(child: Text(intake.bets[index].digitFormated), backgroundColor: Theme.of(context).colorScheme.onPrimary,),
            title: Text(intake.bets[index].amount.toString()),
          ))
        ],
      ),
    );
  }

  Widget _betAmountWidget(Bet bet){
    return Row(
      children: [
        /*
        CircleAvatar(
          child: Text(index.toString().padLeft(2,"0")),
        ),

         */
        // Text(index.toString().padLeft(2,"0") , style: TextStyle(fontWeight: FontWeight.bold),),

        CircleAvatar(
          child: Text(bet.digitFormated),
        ),
        Expanded(
            child: OurTextInput(
                initial: bet.amount.toString(),
                textInputType: TextInputType.number,
                label: bet.digitFormated,
                placeHolder: "Enter Amount",
                textEditingController: TextEditingController(),
                //textEditingController: TextEditingController(text: bet.amount.toString()),
                callback: (String? str){
                  print("BinanceBetAmountPage->callback $str");
                  int amount = int.tryParse(str ?? bet.amount.toString()) ?? bet.amount;
                  bet.amount = amount;
                  Provider.of<BinanceProvider>(context, listen: false).updateBet(bet);
                }
            )
        ),
        IconButton(onPressed: (){
          Provider.of<BinanceProvider>(context, listen: false).removeBet(bet);
        }, icon: Icon(Icons.remove_circle, color: Colors.red,))
      ],
    );
  }
  Widget _digitCard(int digit){
    return InkWell(
      onTap: (){
        print("_digitCard->onTap for $digit");
      },
      // INK to get ripple effect
      child: Ink(
        //color: Colors.blue,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            // color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(digit.toString().padLeft(2,"0")),
          ),
        ),
      ),
    );
  }
}
