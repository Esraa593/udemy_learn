import 'package:learn/models/shop_app/home_model.dart';

class FavoritesModel
{
  bool? status;
  FavoritesDataModel? data;

  FavoritesModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    data = FavoritesDataModel.fromJson(json['data']);
  }
}

class FavoritesDataModel
{
  List<FavDataModel> data = [];
  int? total;

  FavoritesDataModel.fromJson(Map<String, dynamic> json)
  {
    total = json['total'];
    json['data'].forEach((element)
    {
      data.add(FavDataModel.fromJson(element));
    });
  }
}

class FavDataModel
{
  int? favId;
  ProductDataModel? product;

  FavDataModel.fromJson(Map<String, dynamic> json)
  {
    favId = json['id'];
    product = ProductDataModel.fromJson(json['product']);
  }
}

class ProductDataModel
{
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;

  ProductDataModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
  }

}