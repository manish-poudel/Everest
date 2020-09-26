import 'package:everest/AppConfig/AppConfig.dart';
import 'package:everest/Resources/regex.dart';
import 'package:everest/Services/Firebase/firebase_auth_service.dart';
import 'package:provider/provider.dart';

/// Login page Model
/// @author Manish Poudel
/// @createdAt 9/26/2020

class LoginPageModel {
  AppConfig appConfig;
  FirebaseAuthService firebaseAuthService;

  LoginPageModel(context) {
    appConfig = Provider.of<AppConfig>(context, listen: false);
    firebaseAuthService = Provider.of<FirebaseAuthService>(context, listen: false);
  }

  /// On login button pressed
  /// @param email and password
  Future signInWithEmailAndPassword(String email, String password)  {
   return  firebaseAuthService.signInWithEmailAndPassword(email, password);
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
  String passwordValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    }
    if(value.length < 6)
      {
        return 'Please enter a password with at least 6 characters';
      }
    return null;
  }


  /// Get readable login error string based on error code
  /// @param error code
  String getReadableLoginErrMsg(String errorCode)
  {
    switch(errorCode)
    {
      case "user-not-found":
        return "No such user found. Please try again with correct email and password";
        break;
      case "wrong-password":
        return "Looks like you have entered wrong password. Please try again with correct email and password";
        break;
      case "network-request-failed":
        return "Something wrong with network connectivity. Please make sure you have active internet connection and try again with correct email and password";
        break;
      default:
        return "Something went wrong. Please try again.";
    }
  }
}
