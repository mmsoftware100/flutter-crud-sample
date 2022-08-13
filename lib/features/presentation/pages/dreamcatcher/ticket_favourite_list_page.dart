import 'package:base/features/data/const/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../domain/entities/dreamcatcher/ticket.dart';
import '../../../domain/entities/user.dart';
import '../../components/dreamcatcher/login_first.dart';
import '../../components/dreamcatcher/ticker_card.dart';
import '../../providers/ticket_provider.dart';
import '../../providers/user_provider.dart';

class TicketFavouriteListPage extends StatefulWidget {
  static String routeName = "/TicketFavouriteListPage";
  const TicketFavouriteListPage({Key? key}) : super(key: key);

  @override
  _TicketFavouriteListPageState createState() => _TicketFavouriteListPageState();
}

class _TicketFavouriteListPageState extends State<TicketFavouriteListPage> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _loadMoreTickets()async{
    print("TicketCartListPage->_loadMoreVideos");
    String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
    bool status = await Provider.of<TicketProvider>(context, listen:false).getTicketListPlz(accessToken: accessToken, categoryId: TICKET_CATEGORY_FAV);
    Future.delayed(Duration(seconds: 3),(){
      _refreshController.loadComplete();
    });
  }
  void _onRefresh() async{
    print("TicketCartListPage->_onRefresh");
    String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
    bool status = await Provider.of<TicketProvider>(context, listen:false).refreshTicketPlz(accessToken: accessToken, categoryId: TICKET_CATEGORY_FAV);
    Future.delayed(Duration(seconds: 3),(){
      _refreshController.loadComplete();
    });
  }

  void _onLoading() async{
    print("TicketCartListPage->_onLoading");
    _loadMoreTickets();
    await Future.delayed(Duration(milliseconds: 20000));
  }

  @override
  Widget build(BuildContext context) {
    return _mainWidger();
  }


  Widget _mainWidger(){
    return Provider.of<UserProvider>(context, listen: false).user.accessToken == User.sample().accessToken ? LoginFirst() :
    _pullToRefresh(Provider.of<TicketProvider>(context, listen: true).ticketFavRepo);
  }

  Widget _pullToRefresh(List<Ticket> tickets){
    if(tickets.isEmpty){
      return Center(
        child: Text("No favourite ticket.\nAdd favourite ticket", textAlign: TextAlign.center,),
      );
    }
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.separated(
          itemBuilder: (context, index){
            return TicketCard(ticket: tickets[index],);
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: tickets.length
      ),
    );
  }
}
