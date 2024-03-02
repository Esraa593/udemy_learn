import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learn/layouts/shop_app/cubit/cubit.dart';
import 'package:learn/layouts/shop_app/shop_layout.dart';
import 'package:learn/modules/bmi_app/bmi/bmi_screen.dart';
import 'package:learn/modules/counter_app/counter/counter_screen.dart';
import 'package:learn/modules/basics/home/home_screen.dart';
import 'package:learn/modules/basics/login/login_screen.dart';
import 'package:learn/modules/basics/massenger/massenger_screen.dart';
import 'package:learn/modules/basics/users/users_screen.dart';
import 'package:learn/modules/news_app/business/business_screen.dart';
import 'package:learn/modules/shop_app/login/shop_login_screen.dart';
import 'package:learn/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:learn/shared/bloc_observer.dart';
import 'package:learn/shared/components/constants.dart';
import 'package:learn/shared/cubit/cubit.dart';
import 'package:learn/shared/cubit/states.dart';
import 'package:learn/shared/network/local/cache_helper.dart';
import 'package:learn/shared/network/remote/dio_helper.dart';
import 'package:learn/shared/styles/themes.dart';

import 'layouts/news_app/cubit/cubit.dart';
import 'layouts/news_app/news_layout.dart';
import 'layouts/todo_app/todo_layout.dart';
import 'modules/native_code.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  print(token);

  Widget widget;

  if(onBoarding != null)
  {
    if(token != null) {
      widget = ShopLayout();
    } else {
      widget = ShopLoginScreen();
    }
  }else{
    widget = OnBoardingScreen();
  }

  runApp(MyApp(
    isDark: isDark,
    widget: widget,
  ));
}

class MyApp extends StatelessWidget {

  final bool? isDark;
  final Widget? widget;

  MyApp({this.isDark, this.widget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      // BlocProvider(create: (context) => NewsCubit()..getBusiness()),
      BlocProvider(create: (context) => AppCubit()..changeAppMode(fromShared: isDark)),
      BlocProvider(create: (context) => ShopCubit()..getHomeData()..getCategories()..getFavourites()..getUserData()),
    ],
      child: BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          home: NativeCodeScreen(),
        );
      },
    ),
    );
  }
}
