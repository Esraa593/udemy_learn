import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/modules/shop_app/login/cubit/states.dart';
import 'package:learn/shared/network/end_points.dart';
import 'package:learn/shared/network/remote/dio_helper.dart';

import '../../../../models/shop_app/login_model.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit(): super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);


  ShopLoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
})
  {
    emit(ShopLoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value)
    {
      loginModel = ShopLoginModel.fromJson(value.data);

      emit(ShopLoginSuccessState(loginModel!));
    }).catchError((error)
    {
      print(error);
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility()
  {
    isPassword =! isPassword;
      suffix = isPassword? Icons.visibility_outlined : Icons.visibility_off_outlined;
      emit(ShopChangePasswordVisibilityState());
  }

}