class SearchModel
{
  bool? status;
  SearchDataModel? data;

  SearchModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    data = SearchDataModel.fromJson(json['data']);
  }
}

class SearchDataModel
{
  List<DataItemModel> data = [];
  SearchDataModel.fromJson(Map<String, dynamic> json)
  {
    json['data'].forEach((element)
    {
      data.add(DataItemModel.fromJson(element));
    });
  }
}

class DataItemModel
{
  int? id;
  dynamic price;
  String? image;
  String?name;
  bool? inFavorites;
  bool? inCart;
  List<String> images = [];

  DataItemModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    price = json['price'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
    json['images'].forEach((element){
      images.add(element);
    });
  }

}