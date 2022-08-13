import 'package:base/features/data/const/data.dart';
import 'package:base/features/presentation/pages/dreamcatcher/ticket_cart_list_page.dart';
import 'package:base/features/presentation/pages/dreamcatcher/ticket_favourite_list_page.dart';
import 'package:base/features/presentation/pages/dreamcatcher/ticket_order_list_page.dart';
import 'package:base/features/presentation/pages/dreamcatcher/ticket_store_list_page.dart';
import 'package:base/features/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/user.dart';
import '../../providers/ticket_provider.dart';

// four pages
class DreamCatcherHomePage extends StatefulWidget {
  static String routeName = "/DreamCatcherHomePage";
  const DreamCatcherHomePage({Key? key}) : super(key: key);

  @override
  _DreamCatcherHomePageState createState() => _DreamCatcherHomePageState();
}

class _DreamCatcherHomePageState extends State<DreamCatcherHomePage> {




  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    TicketStoreListPage(),
    TicketCartListPage(),
    TicketFavouriteListPage(),
    TicketOrderListPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dream Catcher'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0 ? Icon(Icons.home) : Icon(Icons.home_outlined),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1 ? Icon(Icons.shopping_cart) : Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2 ? Icon(Icons.favorite) : Icon(Icons.favorite_outline),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3 ? Icon(Icons.person) : Icon(Icons.person_outline),
            label: 'Order',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
