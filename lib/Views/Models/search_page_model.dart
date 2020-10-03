import 'package:everest/Resources/regex.dart';
import 'package:everest/Services/Firebase/Firestore/firestore_user_service.dart';
import 'package:everest/Services/Firebase/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

/// Search page model class to handle search operations
/// @since 10/2/2020
/// @author Manish Poudel
class SearchPageModel {
  BuildContext context;
  FirestoreUserService _firestoreUserService;
  Map<String, User> _userMap = Map<String,User>();

  SearchPageModel(this.context) {
    _firestoreUserService =
        Provider.of<FirestoreUserService>(context, listen: false);
  }

  /// Search user
  Future<List<User>> searchUser(text, bool searchByUsername) async {
    return !RegExp(RegexValidator.email).hasMatch(text)?
    (searchByUsername?_searchUserByUsername(text):_searchUserByName(text)): /// If text doesn't match email pattern
     _searchUserByEmail(text); /// If text matches email pattern
  }

  /// Search user by email
  /// @param text
  /// @return Future with list of user
  Future<List<User>> _searchUserByEmail(text)
  async {
    if(text == "")
      throw Exception("Empty string");
    /// Search from username
    _userMap = await _firestoreUserService.searchUserByEmail(text);
    return _userMap.values.toList();
  }

  /// Search user by username
  /// @param text
  /// @return Future with list of user
  Future<List<User>> _searchUserByUsername(text)
  async {
    if(text == "")
      throw Exception("Empty string");
    /// Search from username
    _userMap = await _firestoreUserService.searchUser(
        text: text,
        limit: 7,
        searchBy: 'username');
    return _userMap.values.toList();
  }

  /// Search user by name
  /// @param text
  /// @return Future with list of user
  Future<List<User>> _searchUserByName(text)
  async {
    if(text == "")
      throw Exception("Empty string");
    /// Search from username
    _userMap = await _firestoreUserService.searchUser(
        text: text,
        limit: 7,
        searchBy: 'nameSearchVal');
    return _userMap.values.toList();
  }
}
