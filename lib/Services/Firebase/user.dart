import 'package:flutter/cupertino.dart';

/// User model class
/// @author Manish Poudel
/// @createdAt 9/25/2020

class User {
  String id;
  String emailId;
  String name;
  String username;
  String gender;
  String userProfileUrl;
  DateTime profileCreatedAt;
  Map<String, dynamic> lastUpdated;

  User(
      {@required this.id,
      @required this.emailId,
      @required this.profileCreatedAt,
      @required this.lastUpdated,
      @required this.name,
      @required this.userProfileUrl,
      @required this.username,
      @required this.gender});

  /// Create user object from map
  User.fromMap(Map<String, dynamic> map) {
    print(map.toString());
    id = map["id"];
    emailId = map["emailId"];
    name = map["name"];
    username = map["username"];
    gender = map["gender"];
    userProfileUrl = map["profileImageUrl"];
    profileCreatedAt = map["profileCreatedAt"].toDate();
    lastUpdated = {
      "username" : map["lastUpdated"]["username"].toDate(),
      "name" : map["lastUpdated"]["name"].toDate(),
    };
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["emailId"] = emailId;
    map["name"] = name;
    map["username"] = username;
    map["gender"] = gender;
    map["profileImageUrl"] = userProfileUrl;
    map["profileCreatedAt"] = profileCreatedAt;
    map["lastUpdated"] = lastUpdated;
    return map;
  }
}
