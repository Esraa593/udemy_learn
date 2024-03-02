import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/layouts/shop_app/cubit/cubit.dart';
import 'package:learn/layouts/shop_app/cubit/states.dart';
import 'package:learn/models/shop_app/home_model.dart';
import 'package:learn/shared/components/components.dart';

import '../../../models/shop_app/favorites_model.dart';
import '../../../shared/styles/colors.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! ShopLoadingGetFavoritesState,
          builder:(context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildListProduct(context, ShopCubit.get(context).favoritesModel!.data!.data[index].product),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: ShopCubit.get(context).favoritesModel!.data!.total!,
          ),
          fallback:(context) => Center(child: CircularProgressIndicator()) ,
        );
      },
    );
  }


}
