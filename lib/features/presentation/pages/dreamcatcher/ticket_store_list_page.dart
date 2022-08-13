import 'package:base/core/util/loading_dialog.dart';
import 'package:base/features/data/const/data.dart';
import 'package:base/features/presentation/components/dreamcatcher/ticker_card.dart';
import 'package:base/features/presentation/components/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/util/messenger.dart';
import '../../../domain/entities/dreamcatcher/ticket.dart';
import '../../../domain/entities/user.dart';
import '../../providers/ticket_provider.dart';
import '../../providers/user_provider.dart';

class TicketStoreListPage extends StatefulWidget {
  static String routeName = "/TicketStoreListPage";
  const TicketStoreListPage({Key? key}) : super(key: key);

  @override
  _TicketStoreListPageState createState() => _TicketStoreListPageState();
}

class _TicketStoreListPageState extends State<TicketStoreListPage> {

  bool dataAvailable = false;
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _loadMoreTickets()async{
    print("TicketStoreListPage->_loadMoreVideos");
    String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
    bool status = await Provider.of<TicketProvider>(context, listen:false).getTicketListPlz(accessToken: accessToken, categoryId: TICKET_CATEGORY_STORE);
    Future.delayed(Duration(seconds: 3),(){
      _refreshController.loadComplete();
    });
  }
  void _onRefresh() async{
    print("TicketStoreListPage->_onRefresh");
    String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
    bool status = await Provider.of<TicketProvider>(context, listen:false).refreshTicketPlz(accessToken: accessToken, categoryId: TICKET_CATEGORY_STORE);
    Future.delayed(Duration(seconds: 3),(){
      _refreshController.loadComplete();
    });
  }

  void _onLoading() async{
    print("TicketStoreListPage->_onLoading");
    _loadMoreTickets();
    await Future.delayed(Duration(milliseconds: 20000));
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }
  void _init()async{

    dataAvailable = true;
    setState(() {
    });
    String accessToken = Provider.of<UserProvider>(context, listen: false).user.accessToken;
    if(accessToken != User.sample().accessToken){
      Provider.of<TicketProvider>(context, listen:false).getTicketListPlz(accessToken: accessToken, categoryId: TICKET_CATEGORY_CART);
      Provider.of<TicketProvider>(context, listen:false).getTicketListPlz(accessToken: accessToken, categoryId: TICKET_CATEGORY_FAV);
      Provider.of<TicketProvider>(context, listen:false).getTicketListPlz(accessToken: accessToken, categoryId: TICKET_CATEGORY_ORDER);
    }
    dataAvailable = await Provider.of<TicketProvider>(context, listen:false).getTicketListPlz(accessToken: accessToken, categoryId: TICKET_CATEGORY_STORE);

  }
  @override
  Widget build(BuildContext context) {
    return _mainWidget();
  }


  Widget _refreshWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("No Data Available"),
        SubmitButton(callback: _init, text: "Refresh")
      ],
    );
  }
  Widget _mainWidget(){
    return !dataAvailable ? _refreshWidget() :  _pullToRefresh(Provider.of<TicketProvider>(context, listen: true).ticketStoreRepo);
  }

  Widget _pullToRefresh(List<Ticket> tickets){
    if(tickets.isEmpty){
      return Center(
        child: CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary,)
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
