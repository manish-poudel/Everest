import 'dart:collection';

import 'package:everest/Services/Firebase/Firestore/firestore_user_service.dart';
import 'package:everest/Services/Firebase/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SearchPageModel {
  BuildContext context;
  FirestoreUserService _firestoreUserService;
  Map<String, User> _userMap = LinkedHashMap<String,User>();
  String _searchedByUsernameLastId = "";
  String _searchedByNameLastId = "";

  SearchPageModel(this.context) {
    _firestoreUserService =
        Provider.of<FirestoreUserService>(context, listen: false);
  }

  /// Search user
  Future<List<User>> searchUser(text, bool username, bool name) async {

    print("Searching text" + text);
    print("Searching by username " + username.toString());
    print("Searching by name " + name.toString());
    // print("Text is " + text);
    // if(text == "")
    //   throw Exception("Empty string");
    //
    //
    // /// Search from username
    // _userMap = await _firestoreUserService.searchUser(
    //     text: text,
    //     limit: 7,
    //     searchBy: 'username');
    // List<User> user = _userMap.values.toList();
    // int listLen = user.length;
    // if (listLen > 1) _searchedByUsernameLastId = user[listLen -1].id;
    // if (listLen == 7) return _userMap.values.toList();
    //
    // /// If list value is length than 5, search extra from name
    // Map<String, User> moreUserMap = await _firestoreUserService.searchUser(
    //     text: text,
    //     searchBy: 'nameSearchVal',
    //     limit: 5 - listLen);
    //
    // user = moreUserMap.values.toList();
    // listLen = user.length;
    // if(listLen > 1) _searchedByNameLastId = user[listLen -1].id;
    // moreUserMap.values.forEach((element) {_userMap.putIfAbsent(element.id, () => element);});
    // return _userMap.values.toList();
  }

  /// Search more user
  Future<List<User>> searchMoreUser(text) async {

  }

}
