import 'package:flutter/cupertino.dart';

/// User model class
/// @author Manish Poudel
/// @createdAt 9/25/2020

class User{

  String id;
  String emailId;
  String firstName;
  String lastName;

  User({@required this.id ,@required this.emailId, this.firstName, this.lastName});

  /// Create user object from map
  User.fromMap(Map<String, dynamic> map)
  {
    firstName = map["firstName"];
    lastName = map["lastName"];
  }

  /// Update user from map
  updateUserFromMap(Map<String, dynamic> map)
  {
    firstName = map["firstName"];
    lastName = map["lastName"];
  }
}


