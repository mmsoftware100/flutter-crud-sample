import 'package:base/features/presentation/components/our_text_input.dart';
import 'package:base/features/presentation/components/submit_button.dart';
import 'package:base/features/presentation/pages/binance/binance_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/binance/bet.dart';
import '../../providers/binance_provider.dart';

class BinanceBetConfirmPage extends StatefulWidget {
  static String routeName = "/BinanceBetConfirmPage";
  const BinanceBetConfirmPage({Key? key}) : super(key: key);

  @override
  _BinanceBetConfirmPageState createState() => _BinanceBetConfirmPageState();
}

class _BinanceBetConfirmPageState extends State<BinanceBetConfirmPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 0),(){
      Provider.of<BinanceProvider>(context, listen: false).makeOrder();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      /*
      appBar: AppBar(
        title: Text("Bet Success"),
      ),

       */
      body: SafeArea(child: _mainWidget(Provider.of<BinanceProvider>(context, listen:true).currentIntake.bets)),
    );
  }

  Widget _mainWidget(List<Bet> betList){
    return Column(
      children: [
        Icon(Icons.check_circle, size: 150, color: Colors.green,),
        Text("အောင်မြင်ပါသည်"),
        Expanded(

          child:
          /*GridView.count(
            childAspectRatio: 16/5,
            crossAxisCount: 2,
            children: List.generate(10, (index) =>  _betAmountWidget(index)),
          ),

           */
          ListView.separated(
              itemBuilder: (context, index) => _betAmountWidget(betList[index]),
              separatorBuilder: (context, index) => Container(),
              itemCount: betList.length
          )

        ),
        Row(
          children: [
            // Number of Ticket
            Expanded(child: Text("Total 3,500 MMK")),
            // Add amount Button
            SubmitButton(callback: (){
              // clear current repo and comfirmed
              Provider.of<BinanceProvider>(context, listen: false).resetBetRepo();
              // need to go to Home Page
              Navigator.pushNamedAndRemoveUntil(context, BinanceHomePage.routeName, (route) => false);
            }, text: "OK")
          ],
        )
      ],
    );
  }

  Widget _betAmountWidget(Bet bet){
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 2, spreadRadius: 1, offset: Offset(0,0))
        ]
      ),
      child: Row(
        children: [

          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            child: Text(bet.digitFormated, style: TextStyle(color: Colors.white),),
          ),

          SizedBox(width: 8.0,),
          // Text(index.toString().padLeft(2,"0") , style: TextStyle(fontWeight: FontWeight.bold),),
          Expanded(
              child: Text(bet.amount.toString() + " MMK", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
              /*OurTextInput(
                  textInputType: TextInputType.number,
                  label: index.toString().padLeft(2,"0"),
                  placeHolder: "Enter Amount",
                  textEditingController: TextEditingController(text: (index * 5).toString()),
                  callback: (String? str){}
              )

               */
          ),
          Icon(Icons.check_circle, color: Colors.green,)
        ],
      ),
    );
  }
}
