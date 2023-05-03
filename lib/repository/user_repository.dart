import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/users/user_model.dart';


import 'package:flutter/material.dart';

class MySnackbarClass {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}





// class userRepository{
//   final _db = FirebaseFirestore.instance;
//   createUser(UserModel user) async{
//     await _db.collection('tasks').add(user.toJson());
//   }
// }