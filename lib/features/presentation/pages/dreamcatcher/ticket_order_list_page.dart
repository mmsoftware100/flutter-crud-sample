import 'package:base/features/data/const/data.dart';
import 'package:base/features/presentation/components/dreamcatcher/user_info_card.dart';
import 'package:base/features/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../domain/entities/dreamcatcher/ticket.dart';
import '../../../domain/entities/user.dart';
import '../../components/dreamcatcher/login_first.dart';
import '../../components/dreamcatcher/ticker_card.dart';
import '../../providers/ticket_provider.dart';
import '../../providers/user_provider.dart';

class TicketOrderListPage extends StatefulWidget {
  static String routeName = "/TicketOrderListPage";
  const TicketOrderListPage({Key? key}) : super(key: key);

  @override
  _TicketOrderListPageState createState() => _TicketOrderListPageState();
}

class _TicketOrderListPageState extends State<TicketOrderListPage> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _loadMoreTickets()async{
    print("TicketOrderListPage->_loadMoreVideos");
    String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
    bool status = await Provider.of<TicketProvider>(context, listen:false).getTicketListPlz(accessToken: accessToken, categoryId: TICKET_CATEGORY_ORDER);
    Future.delayed(Duration(seconds: 3),(){
      _refreshController.loadComplete();
    });
  }
  void _onRefresh() async{
    print("TicketOrderListPage->_onRefresh");
    String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
    bool status = await Provider.of<TicketProvider>(context, listen:false).refreshTicketPlz(accessToken: accessToken, categoryId: TICKET_CATEGORY_ORDER);
    Future.delayed(Duration(seconds: 3),(){
      _refreshController.loadComplete();
    });
  }

  void _onLoading() async{
    print("TicketOrderListPage->_onLoading");
    _loadMoreTickets();
    await Future.delayed(Duration(milliseconds: 20000));
  }

  @override
  Widget build(BuildContext context) {
    return _mainWidget();
  }


  Widget _mainWidget(){
    return Provider.of<UserProvider>(context, listen: false).user.accessToken == User.sample().accessToken ? LoginFirst() :
    Column(
      children: [
        UserInfoCard(user: Provider.of<UserProvider>(context, listen: true).user),
        Expanded(child: _pullToRefresh(Provider.of<TicketProvider>(context, listen: true).ticketOrderRepo)),
      ],
    );
  }

  Widget _pullToRefresh(List<Ticket> tickets){
    if(tickets.isEmpty){
      return Center(
        child: Text("No Ticket in Your Order,\nMake order", textAlign: TextAlign.center,),
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
