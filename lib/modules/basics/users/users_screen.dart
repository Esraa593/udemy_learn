import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/user/user_model.dart';


class UsersScreen extends StatelessWidget{

  List<UserModel> users =[
    UserModel(
        id: 1,
        name: 'Esraa Gamal',
        phone:'+023546544231'),
    UserModel(
        id: 2,
        name: 'Ahmed Gamal',
        phone:'+023254844231'),
    UserModel(
        id: 3,
        name: 'Mohamed Gamal',
        phone:'+023546599231'),
    UserModel(
        id: 1,
        name: 'Esraa Gamal',
        phone:'+023546544231'),
    UserModel(
        id: 2,
        name: 'Ahmed Gamal',
        phone:'+023254844231'),
    UserModel(
        id: 3,
        name: 'Mohamed Gamal',
        phone:'+023546599231'),
    UserModel(
        id: 1,
        name: 'Esraa Gamal',
        phone:'+023546544231'),
    UserModel(
        id: 2,
        name: 'Ahmed Gamal',
        phone:'+023254844231'),
    UserModel(
        id: 3,
        name: 'Mohamed Gamal',
        phone:'+023546599231'),
    UserModel(
        id: 1,
        name: 'Esraa Gamal',
        phone:'+023546544231'),
    UserModel(
        id: 2,
        name: 'Ahmed Gamal',
        phone:'+023254844231'),
    UserModel(
        id: 3,
        name: 'Mohamed Gamal',
        phone:'+023546599231'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Users',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.white,
          ),

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
            itemBuilder: (context, index) => buildUserItem(users[index]),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 10.0,
                top: 10.0,
                start: 15.0
              ),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            itemCount: users.length),
      ),
    );
  }



  Widget buildUserItem(UserModel user) =>Row(
    children: [
      CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 30.0,
        child: Text(
          '${user.id}',
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        width: 20.0,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${user.name}',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${user.phone}',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ],
  );

}