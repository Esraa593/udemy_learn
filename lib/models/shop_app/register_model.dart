class ShopRegisterModel
{
  bool? status;
  String? message;
  RegUserData? data;

  ShopRegisterModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? RegUserData.fromJson(json['data']): null;

  }

}

class RegUserData
{
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;


  // named constructor
  RegUserData.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
  }

}