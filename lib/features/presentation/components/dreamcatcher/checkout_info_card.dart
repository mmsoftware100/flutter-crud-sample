import 'package:base/core/util/alert_dialog.dart';
import 'package:base/core/util/loading_dialog.dart';
import 'package:base/features/presentation/components/dreamcatcher/order_receipt.dart';
import 'package:base/features/presentation/components/submit_button.dart';
import 'package:base/features/presentation/providers/ticket_provider.dart';
import 'package:base/features/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/user.dart';

class CheckoutInfoCard extends StatelessWidget {
  //final User user;
  const CheckoutInfoCard({
    Key? key,
    //required this.user
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
      child: Column(
        children: [
          Row(
            children: [
              // user circle avator

              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                child: Icon(Icons.shopping_cart),
              ),
              SizedBox(width: 8.0,),
              // Name and phone column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text("Ticket Price")),
                        Expanded(child: Text("1,100 MMK"))
                      ],
                    ),
                    SizedBox(height: 8.0,),
                    Row(
                      children: [
                        Expanded(child: Text("Ticket")),
                        Expanded(child: Text(Provider.of<TicketProvider>(context, listen: true).ticketCartRepo.length.toString()))
                      ],
                    ),
                    SizedBox(height: 8.0,),
                    Row(
                      children: [
                        Expanded(child: Text("Total("+
                            Provider.of<TicketProvider>(context, listen: true).ticketCartRepo.length.toString() +
                            " * " +
                            "1,1000 )"
                        )),
                        Expanded(child: Text(
                            (Provider.of<TicketProvider>(context, listen: true).ticketCartRepo.length * 1100).toString() +
                            " MMK"
                        ))
                      ],
                    )
                  ],
                ),
              ),

              // logout button
            ],
          ),
          SizedBox(height: 8.0,),
          SubmitButton(callback: ()async{
            print("CheckoutInfoCard");
            LoadingDialog.show(context);
            String accessToken = Provider.of<UserProvider>(context, listen:false).user.accessToken;
            bool status = await Provider.of<TicketProvider>(context, listen:false).makeOrderPlz(accessToken: accessToken);
            print("CheckoutInfoCard->status $status");
            Future.delayed(Duration(seconds: 3),(){
              LoadingDialog.hide(context);
              if(status){
                OurAlertDialog.fullScreen(context, OrderReceipt());
              }
              else{
                OurAlertDialog.fullScreen(context, Center(child: Text("Error in making Order"),));
              }
            });
          }, text: "Checkout")
        ],
      ),
    );
  }
}
