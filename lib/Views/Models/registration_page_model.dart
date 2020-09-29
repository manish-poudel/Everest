import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Resources/regex.dart';
import 'package:everest/Services/Firebase/firebase_auth_service.dart';
import 'package:provider/provider.dart';

/// Login page Model
/// @author Manish Poudel
/// @createdAt 9/26/2020

class RegistrationPageModel {
  FirebaseAuthService firebaseAuthService;

  RegistrationPageModel(context) {
    firebaseAuthService =
        Provider.of<FirebaseAuthService>(context, listen: false);
  }

  /// Register user with email and password
  /// @param email and password
  Future registerWithEmailAndPassword(String email, String password) {
    return firebaseAuthService.registerWithEmailAndPassword(email, password);
  }

  /// Validation for email text field
  /// @param value sent by text field
  /// @returns String for validation error msg or null
  String emailValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(RegexValidator.email).hasMatch(value)) {
      return "Please enter valid email";
    }
    return null;
  }

  /// Validation for email text field
  /// @param value sent by text field
  /// @returns String for validation error msg or null
  String passwordValidator(value, value2) {
    if (value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Please enter a password with at least 6 characters';
    }
    if (value != value2) {
      return "Password didn't match";
    }
    return null;
  }

  /// Get readable login error string based on error code
  /// @param error code
  String getReadableLoginErrMsg(String errorCode) {
    print(errorCode);
    switch (errorCode) {
      case "email-already-in-use":
        return "Sorry! Email id already exists. Please try again with different email id.";
        break;
      case "network-request-failed":
        return "Something wrong with network connectivity. Please make sure you have active internet connection and try again.";
        break;
      default:
        return "Something went wrong. Please try again.";
    }
  }
}
