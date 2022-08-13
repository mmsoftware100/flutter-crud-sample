import 'package:base/features/data/const/data.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_amount_page.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_list_page.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_select_page.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_type_select_page.dart';
import 'package:base/features/presentation/pages/binance/binance_profile_page.dart';
import 'package:base/features/presentation/pages/dreamcatcher/ticket_cart_list_page.dart';
import 'package:base/features/presentation/pages/dreamcatcher/ticket_favourite_list_page.dart';
import 'package:base/features/presentation/pages/dreamcatcher/ticket_order_list_page.dart';
import 'package:base/features/presentation/pages/dreamcatcher/ticket_store_list_page.dart';
import 'package:base/features/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/themes/spt_theme.dart';
import '../../../domain/entities/user.dart';
import '../../providers/ticket_provider.dart';
import 'binance_transaction_list_page.dart';

// four pages
class BinanceHomePage extends StatefulWidget {
  static String routeName = "/BinanceHomePage";
  const BinanceHomePage({Key? key}) : super(key: key);

  @override
  _BinanceHomePageState createState() => _BinanceHomePageState();
}

class _BinanceHomePageState extends State<BinanceHomePage> {




  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    BinanceBetTypeSelectPage(),
    BinanceBetListPage(),
    BinanceTransactionListPage(),
    BinanceProfilePage(),
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
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(appName, style: TextStyle(color: Colors.red )),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Theme.of(context).colorScheme.surface,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.red,
        items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.surface,
            icon: _selectedIndex == 0 ? Icon(Icons.home) : Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.surface,
            icon: _selectedIndex == 1 ? Icon(Icons.shopping_cart) : Icon(Icons.shopping_cart_outlined),
            label: 'List',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.surface,
            icon: _selectedIndex == 2 ? Icon(Icons.list) : Icon(Icons.list_outlined),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.surface,
            icon: _selectedIndex == 3 ? Icon(Icons.person) : Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
