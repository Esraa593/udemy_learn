import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/layouts/shop_app/cubit/cubit.dart';
import 'package:learn/layouts/shop_app/cubit/states.dart';
import 'package:learn/models/shop_app/categories_model.dart';
import 'package:learn/shared/components/components.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var cubit= ShopCubit.get(context);

        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildCatItem(cubit.categoriesModel!.data!.data[index]),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: cubit.categoriesModel!.data!.data.length,
        );
      },
    );
  }

  Widget buildCatItem(DataModel model) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image(
              height: 80.0,
              width: 80.0,
              fit: BoxFit.cover,
              image: NetworkImage(
                  model.image!),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              model.name!,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      );
}
