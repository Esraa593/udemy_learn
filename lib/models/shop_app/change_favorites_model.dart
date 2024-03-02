class ChangeFavoritesModel
{
  bool? status;
  String? message;
  // FavoritesDataModel? data;

  ChangeFavoritesModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    // data = FavoritesDataModel.fromJson(json['data']);
  }
  
}

// class FavoritesDataModel
// {
//   int? id;
//   FavProductModel? product;
//
//   FavoritesDataModel.fromJson(Map<String, dynamic> json)
//   {
//     id = json['id'];
//     product = FavProductModel.fromJson(json['product']);
//   }
//
// }
// class FavProductModel
// {
//   int? id;
//   int? price;
//   int? oldPrice;
//   int? discount;
//   String? image;
//
//   FavProductModel.fromJson(Map<String, dynamic> json)
//   {
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//   }
//
// }