import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/layouts/news_app/cubit/states.dart';
import 'package:learn/modules/news_app/business/business_screen.dart';
import 'package:learn/modules/news_app/science/science_screen.dart';
import 'package:learn/modules/shop_app/settings/settings_screen.dart';

import '../../../modules/news_app/sports/sports_screen.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    } else if (index == 2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<Widget> screens = [
    BusinessScreen(key: UniqueKey()),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];

  // List<String> urlToImage = [];

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '08d27ea4bd6b47969347311c5688bb87',
      },
    ).then((value) {
      business = value.data['articles'];

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print('error is : ${error.toString()}');

      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());

    if (sports.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '08d27ea4bd6b47969347311c5688bb87',
        },
      ).then((value) {
        // print(value.data.toString());
        sports = value.data['articles'];
        // print(sports[0]['title']);

        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print('error is : ${error.toString()}');

        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());

    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '08d27ea4bd6b47969347311c5688bb87',
        },
      ).then((value) {
        science = value.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print('error is : ${error.toString()}');
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void searchData(text) {

    search = [];

    emit(NewsSearchDataLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$text',
        'apiKey': '08d27ea4bd6b47969347311c5688bb87',
      },
    ).then((value) {
      search = value.data['articles'];
      print(search[0]['title'].toString());
      emit(NewsSearchDataSuccessState());
    }).catchError((error) {
      print('error is : ${error.toString()}');
      emit(NewsSearchDataErrorState(error.toString()));
    });
  }
}
