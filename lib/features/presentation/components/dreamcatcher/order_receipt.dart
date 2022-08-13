import 'package:base/features/presentation/components/submit_button.dart';
import 'package:flutter/material.dart';

class OrderReceipt extends StatelessWidget {
  const OrderReceipt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: _mainWidget(context))
    );
  }
  Widget _mainWidget(BuildContext context){
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.close),
                  SizedBox(width: 8.0,),
                  Text("ပိတ်မည်")
                ],
              ),
            ),
          ),
          // right ticket

          Icon(Icons.check_circle, size: 150, color: Colors.green,),
          // info text
          // Text("3 tickets ordered"),
          RichText(text: TextSpan(
            text: "Tickets",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: " Ordered", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.normal))
            ]
          )),
          SizedBox(height: 24.0,),

          Text("Kpay Account 09681148976 (Aung Ko Man) သို့ ထီတစ်စောင် (၁,၁၀၀) ကျပ်နှုန်းဖြင့် ကျသင့်ငွေ အား လွှဲပြီး screenshot ကို Dream Catcher Facebook Page ရဲ့ cb မှာ ပေးပို့ထားနိုင်ပါပြီ"),

          SubmitButton(callback: (){
            // TODO: need to open facebook | use url_launch
          }, text: "Dream Catcher Facebook Page"),

          // go to facebook page
        ],
      ),
    );
  }
}
