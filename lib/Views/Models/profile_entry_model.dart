import 'package:everest/Resources/regex.dart';
import 'package:everest/Services/Firebase/User.dart';
import 'package:everest/Services/Firebase/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

/// Profile entry page Model
/// @author Manish Poudel
/// @createdAt 9/26/2020

class ProfileEntryModel {

  BuildContext context;

  ProfileEntryModel({@required this.context});

  /// Save user profile
  saveProfile(User user)
  {
    FirestoreService  firestoreService = Provider.of<FirestoreService>(context,listen: false);
    firestoreService.saveUser(user);
  }

  /// Validation for first name text field
  /// @param value sent by text field
  /// @returns String for validation error msg or null
  String firstNameValidator(value) {
    print(value);
    if (value.isEmpty) {
      return 'Please enter your first name properly';
    }
    if (RegExp(RegexValidator.name).hasMatch(value)) {
      return "Please enter valid first name";
    }
    return null;
  }

  /// Validation for last name text field
  /// @param value sent by text field
  /// @returns String for validation error msg or null
  String lastNameValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your last name properly';
    }
    if (RegExp(RegexValidator.name).hasMatch(value)) {
      return "Please enter valid last name";
    }
    return null;
  }

}
