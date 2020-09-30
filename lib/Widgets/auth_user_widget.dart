import 'package:everest/Services/Firebase/user.dart';
import 'package:everest/Views/dashboard.dart';
import 'package:everest/Views/intro_page.dart';
import 'package:everest/Views/profile_entry_page.dart';
import 'package:everest/Widgets/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

/// Builds the signed-in or non signed-in UI, depending on the user snapshot.
/// This widget should be below the [MaterialApp].
/// An [AuthWidgetBuilder] ancestor is required for this widget to work.
class AuthUserWidget extends StatelessWidget {
  const AuthUserWidget({Key key, @required this.userSnapshot, @required this.authSnapshot}) : super(key: key);
  final AsyncSnapshot<User> userSnapshot;
  final AsyncSnapshot<firebase_auth.User> authSnapshot;

  @override
  Widget build(BuildContext context) {
    if(authSnapshot.connectionState == ConnectionState.active)
      {
        if(!authSnapshot.hasData)
          {
            return IntroPage();
          }
        else{
          if(userSnapshot.connectionState == ConnectionState.active)
            {
             return userSnapshot.hasData?Dashboard():ProfileEntryPage();
            }
          return _returnDefaultWidget();
        }
      }
    return _returnDefaultWidget();
  }

  /// Default widget while task in progress
  Widget _returnDefaultWidget()
  {
    return Scaffold(
      body: Center(
        child: AppLogo(),
      ),
    );
  }
}
