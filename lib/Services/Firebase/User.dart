import 'package:flutter/cupertino.dart';

/// User model class
/// @author Manish Poudel
/// @createdAt 9/25/2020

class User {
  String id;
  String emailId;
  String firstName;
  String lastName;
  String gender;
  String userProfileUrl;

  User(
      {@required this.id,
      @required this.emailId,
      this.firstName,
      this.userProfileUrl = "",
      this.lastName,
      this.gender});

  /// Create user object from map
  User.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    emailId = map["emailId"];
    firstName = map["firstName"];
    lastName = map["lastName"];
    gender = map["gender"];
    userProfileUrl = map["userProfileUrl"];
  }

  /// Update user from map
  updateUserFromMap(Map<String, dynamic> map) {
    id = map["id"];
    emailId = map["emailId"];
    firstName = map["firstName"];
    lastName = map["lastName"];
    gender = map["gender"];
    userProfileUrl = map["userProfileUrl"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["emailId"] = emailId;
    map["firstName"] = firstName;
    map["lastName"] = lastName;
    map["gender"] = gender;
    map["userProfileUrl"] = userProfileUrl;
    return map;
  }
}
