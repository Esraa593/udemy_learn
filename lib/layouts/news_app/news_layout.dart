import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/layouts/news_app/cubit/cubit.dart';
import 'package:learn/layouts/news_app/cubit/states.dart';
import 'package:learn/shared/cubit/cubit.dart';
import 'package:learn/shared/network/remote/dio_helper.dart';

import '../../modules/news_app/search/search_screen.dart';
import '../../shared/components/components.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness() ,
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);

            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'News App',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: ()
                    {
                      navigateTo(context,SearchScreen());
                    },
                    icon: Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: ()
                    {
                      AppCubit.get(context).changeAppMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined),
                  ),
                ],
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                items: cubit.bottomItems,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);

                },
                currentIndex: cubit.currentIndex,
              ),
            );
          }),
    );
  }
}
