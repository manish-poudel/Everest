import 'package:everest/Resources/regex.dart';
import 'package:everest/Services/Firebase/Firestore/firestore_user_service.dart';
import 'package:everest/Services/Firebase/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

/// Profile entry page Model
/// @author Manish Poudel
/// @createdAt 9/26/2020

class ProfileEntryModel {
  BuildContext context;

  ProfileEntryModel({@required this.context});

  /// Save user profile
  Future<void> saveProfile(User user) {
    FirestoreUserService firestoreService =
        Provider.of<FirestoreUserService>(context, listen: false);
    return firestoreService.saveUser(user);
  }

  Future<bool> usernameExists(username)
  async {
    FirestoreUserService firestoreService =
    Provider.of<FirestoreUserService>(context, listen: false);
    return await firestoreService.checkIfUserNameExists(username);
  }

  /// Validation for first name text field
  /// @param value sent by text field
  /// @returns String for validation error msg or null
  String firstNameValidator(value) {
    print(value);
    if (value.isEmpty) {
      return 'Please enter your name properly';
    }
    if (RegExp(RegexValidator.name).hasMatch(value)) {
      return "Please enter your name properly";
    }
    return null;
  }

  /// Validation for last name text field
  /// @param value sent by text field
  /// @returns String for validation error msg or null
  String usernameValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your username properly';
    }
    if (!RegExp(RegexValidator.username).hasMatch(value)) {
      return "Allowed only \n- lowercase letters \n- numbers \n- underscore \n- and should be in range between 5-30.";
    }

    return null;
  }
}
