import 'package:everest/Services/Firebase/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Setting page in the dashboard
/// @author Manish Poudel
/// @createdAt 9/27/2020

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<FirebaseAuthService>(context, listen: false);
    return Container(
      child: Center(
        child: FlatButton(
          child: Text("Sign out"),
          onPressed: () => authService.signOut(),
        ),
      ),
    );
  }
}
