import 'dart:io';

import 'package:base/features/presentation/pages/article_category_page.dart';
import 'package:base/features/presentation/pages/article_detail_page.dart';
import 'package:base/features/presentation/pages/article_favourite_page.dart';
import 'package:base/features/presentation/pages/article_home_listing_page.dart';
import 'package:base/features/presentation/pages/article_home_page.dart';
import 'package:base/features/presentation/pages/article_list_by_category_page.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_amount_page.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_confirm_page.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_list_page.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_select_page.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_time_select_page.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_type_select_page.dart';
import 'package:base/features/presentation/pages/binance/binance_home_page.dart';
import 'package:base/features/presentation/pages/binance/binance_profile_page.dart';
import 'package:base/features/presentation/pages/binance/binance_transaction_list_page.dart';
import 'package:base/features/presentation/pages/dreamcatcher/dreamcatcher_home_page.dart';
import 'package:base/features/presentation/pages/login_page.dart';
import 'package:base/features/presentation/pages/register_page.dart';
import 'package:base/features/presentation/providers/article_provider.dart';
import 'package:base/features/presentation/providers/binance_provider.dart';
import 'package:flutter/material.dart';
import 'features/data/const/data.dart';
import 'features/data/themes/spt_theme.dart';
import 'features/presentation/providers/ticket_provider.dart';
import 'features/presentation/providers/user_provider.dart';
import 'injection_container.dart' as di;

import 'package:provider/provider.dart';


void main() async{
  // runApp(const MyApp());



  WidgetsFlutterBinding.ensureInitialized();


  await di.init();
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => BinanceProvider()),
            ChangeNotifierProvider(create: (_) =>ArticleProvider(
                client: di.sl(),
                sharedPreferences: di.sl()
            )),
            ChangeNotifierProvider(create: (_) =>UserProvider(
                userLogin: di.sl(),
                userRegister: di.sl()
            )),
            ChangeNotifierProvider(create: (_) =>TicketProvider(
              getTicketList: di.sl(),
              addToCart: di.sl(),
              addToFavourite: di.sl(),
              makeOrder: di.sl(),
            )),
          ],
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: sptTheme,

      //theme: ThemeData(),

      initialRoute: ArticleHomePage.routeName,
      routes: {
        ArticleHomePage.routeName : (context) => ArticleHomePage(),
        ArticleHomeListingPage.routeName : (context) => ArticleHomeListingPage(),
        ArticleCategoryPage.routeName : (context) => ArticleCategoryPage(),
        ArticleFavouritePage.routeName : (context) => ArticleFavouritePage(),
        ArticleDetailPage.routeName : (context) => ArticleDetailPage(),
        ArticleFavouritePage.routeName : (context) => ArticleFavouritePage(),
        ArticleListByCategoryPage.routeName : (context) => ArticleListByCategoryPage(),


        BinanceHomePage.routeName : (context) => BinanceHomePage(),
        BinanceBetAmountPage.routeName : (context) => BinanceBetAmountPage(),
        BinanceBetConfirmPage.routeName : (context) => BinanceBetConfirmPage(),
        DreamCatcherHomePage.routeName : (context) => DreamCatcherHomePage(),
        LoginPage.routeName : (context) => LoginPage(),
        RegisterPage.routeName : (context) => RegisterPage(),
        BinanceBetTypeSelectPage.routeName : (context) => BinanceBetTypeSelectPage(),
        BinanceBetTimeSelectPage.routeName : (context) => BinanceBetTimeSelectPage(),
        BinanceBetSelectPage.routeName : (context) => BinanceBetSelectPage(),
        BinanceBetListPage.routeName : (context) => BinanceBetListPage(),
        BinanceProfilePage.routeName : (context) => BinanceProfilePage(),
        BinanceTransactionListPage.routeName : (context) => BinanceTransactionListPage()
        // SptVideoSearchPage.routeName : (context) => SptVideoSearchPage()
      },
    );
  }
}

