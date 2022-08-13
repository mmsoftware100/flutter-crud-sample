import 'package:base/features/data/datasources/latest_news_remote_data_source.dart';
import 'package:base/features/data/datasources/meta_data_remote_data_source.dart';
import 'package:base/features/data/datasources/ticket_remote_data_source.dart';
import 'package:base/features/data/datasources/user_remote_data_source.dart';
import 'package:base/features/data/datasources/video_remote_data_source.dart';
import 'package:base/features/data/repositories/latest_news_repository_impl.dart';
import 'package:base/features/data/repositories/meta_data_repository_impl.dart';
import 'package:base/features/data/repositories/ticket_repository_impl.dart';
import 'package:base/features/data/repositories/video_repository_impl.dart';
import 'package:base/features/domain/repositories/latest_news_repository.dart';
import 'package:base/features/domain/repositories/meta_data_repository.dart';
import 'package:base/features/domain/repositories/ticket_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:base/features/domain/repositories/video_repository.dart';
import 'package:base/features/domain/usecases/add_to_cart.dart';
import 'package:base/features/domain/usecases/add_to_favourite.dart';
import 'package:base/features/domain/usecases/get_latest_news.dart';
import 'package:base/features/domain/usecases/get_meta_data_list.dart';
import 'package:base/features/domain/usecases/get_ticket_list.dart';
import 'package:base/features/domain/usecases/get_video_list.dart';
import 'package:base/features/domain/usecases/make_order.dart';
import 'package:base/features/domain/usecases/user_login.dart';
import 'package:base/features/domain/usecases/user_register.dart';
import 'package:base/features/presentation/providers/article_provider.dart';
import 'package:base/features/presentation/providers/latest_news_provider.dart';
import 'package:base/features/presentation/providers/spt_meta_data_provider.dart';
import 'package:base/features/presentation/providers/spt_video_provider.dart';
import 'package:base/features/presentation/providers/ticket_provider.dart';
import 'package:base/features/presentation/providers/user_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/data/repositories/user_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /* Factory ဆိုတာက App တစ်ခုလုံးမှာမှ တစ်ခုပဲ ရှိမယ့် ဟာမျိုးကို ဆိုလိုတာလား မသိ */
  /// Providers
  sl.registerFactory(
          () => UserProvider(
            userLogin: sl(),
            userRegister: sl(),
      )
  );
  sl.registerFactory(
          () => TicketProvider(
              getTicketList: sl(),
              addToCart: sl(),
              addToFavourite: sl(),
              makeOrder: sl(),
          )
  );

  sl.registerFactory(
          () => ArticleProvider(
            client: sl(),
            sharedPreferences: sl(),
      )
  );


  // ဒီကောင်က implement လုပ်ထားတဲ့ class
  /// Use Cases
  sl.registerLazySingleton<UserRegister>(() =>  UserRegister(userRepository: sl()));
  sl.registerLazySingleton<UserLogin>(() =>  UserLogin(userRepository: sl()));
  sl.registerLazySingleton<GetTicketList>(() =>  GetTicketList(ticketRepository: sl()));
  sl.registerLazySingleton<AddToCart>(() =>  AddToCart(ticketRepository: sl()));
  sl.registerLazySingleton<AddToFavourite>(() =>  AddToFavourite(ticketRepository: sl()));
  sl.registerLazySingleton<MakeOrder>(() =>  MakeOrder(ticketRepository: sl()));


  // ဒါလည်း အတူတူပဲ
  /// Repositories
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(userRemoteDataSource: sl()));
  sl.registerLazySingleton<TicketRepository>(() => TicketRepositoryImpl(ticketRemoteDataSource: sl()));

  // ဆိုလိုတာက ဒီ interface နဲ့ လိုနေရင် ဒီ impl class ကို ယူသုံးပါ ဆိုတာမျိုး။
  // Data Sources
  sl.registerLazySingleton<TicketRemoteDataSource>(() => TicketRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(client: sl()));

  // external
  // DIO က လည်း အမှန်တော့ Abstract တစ်ခု ခံပြီးသုံးသင့်တာ။
  // အခုတော့ ဒီအတိုင်း သုံးထားတယ်၊ နောက်တော့ ပြောင်းရမယ်
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => prefs);
  sl.registerLazySingleton(() => Dio());
}
