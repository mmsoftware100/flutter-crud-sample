

import 'dart:ui';

import 'package:base/features/presentation/providers/ticket_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/util/loading_dialog.dart';
import '../../../../core/util/messenger.dart';
import '../../../domain/entities/dreamcatcher/ticket.dart';
import '../../providers/user_provider.dart';

class TicketCard extends StatefulWidget {
  Ticket ticket;
  TicketCard({
    Key? key,
    required this.ticket
  }) : super(key: key);

  @override
  _TicketCardState createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  @override
  Widget build(BuildContext context) {
    return _ticketCard(widget.ticket);
  }

  /*
   Positioned.fill(
      child: Image.asset(
        'images/sBoeM.jpg',
        repeat: ImageRepeat.repeat,
      ),
    ),
   */
  Widget _ticketCard(Ticket ticket){
    return Stack(
      children: [

        /*
        Positioned.fill(
          child: Image.asset(
            'assets/images/ticket_background.jpg',
            repeat: ImageRepeat.repeat,
          ),
        ),

         */


        /*
        Container(
            margin: EdgeInsets.all(16.0),

            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/ticket_background.jpg"),
                  repeat: ImageRepeat.repeat,
                ),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey,blurRadius: 3.0, spreadRadius: 3.0, offset: Offset(3,3))
                ]
            ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(),
          ),
        ),

         */


        Container(
          //padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.all(16.0),

          decoration: BoxDecoration(

            /*
              image: DecorationImage(
                image: AssetImage("assets/images/dolors.jpg"),
                //repeat: ImageRepeat.repeat,
                fit: BoxFit.cover
              ),

             */

              borderRadius: BorderRadius.circular(8.0),
              // color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 8.0, spreadRadius: 1.0, offset: Offset(3,3))
              ],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.white]
              )
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(ticket.name, style: TextStyle(color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.bold, fontSize: 24,letterSpacing: 2.0, shadows: [BoxShadow(color: Colors.black26, spreadRadius: 3.0)]),),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue, // Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.0)
                      )
                    ),
                    child: IconButton(onPressed: ()async{
                      print("Fab->onPressed");
                      LoadingDialog.show(context);
                      String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
                      bool status = await Provider.of<TicketProvider>(context, listen: false).addToFavouritePlz(
                          accessToken: accessToken,
                          ticketId: ticket.id,
                          favourite: !ticket.favourite
                      );
                      Future.delayed(Duration(seconds: 2),(){
                        LoadingDialog.hide(context);
                        if(status){
                          OurMessenger.showUp(context, "Toggle favourite success");
                        }
                        else{
                          OurMessenger.showUp(context, "Toggle favourite fail");
                        }
                      });
                    }, icon: ticket.favourite ? Icon(Icons.favorite) : Icon(Icons.favorite_outline)),
                  ),
                  Expanded(child: Container()),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue, // Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0)
                        )
                    ),
                    child: IconButton(
                        onPressed: ()async{
                          print("Cart->onPressed");
                          LoadingDialog.show(context);
                          String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
                          bool status = await Provider.of<TicketProvider>(context, listen: false).addToCartPlz(
                              accessToken: accessToken,
                              ticketId: ticket.id,
                              cart: ticket.ticketStatusId == 1 ? false : true
                          );

                          Future.delayed(Duration(seconds: 5),(){
                            LoadingDialog.hide(context);
                            OurMessenger.showUp(context, "Add to cart");
                          });
                        },
                        icon: Icon(Icons.add_shopping_cart)),
                  ),
                ],
              )
            ],
          ),
        ),

      ],
    );

  }
}
