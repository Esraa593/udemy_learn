import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/modules/shop_app/register/cubit/states.dart';
import 'package:learn/shared/network/remote/dio_helper.dart';

import '../../../../models/shop_app/register_model.dart';
import '../../../../shared/network/end_points.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates>
{
  ShopRegisterCubit(): super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  ShopRegisterModel? registerModel;

  void userRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
})
  {
    emit(ShopRegisterLoadingState());

    DioHelper.postData(
        url: REGISTER,
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
        },
    ).then((value)
    {

      registerModel = ShopRegisterModel.fromJson(value.data);

      print(registerModel!.message);
      // print(registerModel!.data!.email);


      emit(ShopRegisterSuccessState(registerModel!));
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility()
  {
    isPassword =! isPassword;
    suffix = isPassword? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopRegisterChangePasswordVisibilityState());
  }

}