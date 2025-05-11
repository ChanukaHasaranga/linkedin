import 'package:flutter/material.dart';
import 'package:linkedin/model/users_model.dart';

class UsersViewModel extends ChangeNotifier {
  final List<UsersModel> _posts = [
    UsersModel(
      userName: 'John Doe',
      profilepic: "assets/user1.png"
    ),
    UsersModel(
      userName: 'Jane Smith',
      profilepic: "assets/user2.png"
    ),
       UsersModel(
     userName: 'John Doe',
     profilepic: "assets/user1.png"
   ),

     UsersModel(
   userName: 'John Doe',
   profilepic: "assets/user3.png"
 ),

   UsersModel(
     userName: 'Jane Smith',
     profilepic: "assets/user2.png"
   ),
      UsersModel(
     userName: 'John Doe',
     profilepic: "assets/user1.png"
   ),
        UsersModel(
   userName: 'John Doe',
   profilepic: "assets/user3.png"
 ),
   UsersModel(
     userName: 'Jane Smith',
     profilepic: "assets/user2.png"
   ),
        UsersModel(
   userName: 'John Doe',
   profilepic: "assets/user3.png"
 ),
  ];

  List<UsersModel> get users => _posts;
}
