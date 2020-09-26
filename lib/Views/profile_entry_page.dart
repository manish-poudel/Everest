import 'package:everest/Resources/app_theme.dart';
import 'package:everest/Services/Firebase/User.dart';
import 'package:everest/Services/Firebase/firebase_auth_service.dart';
import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:everest/Utilities/ViewUtility.dart';
import 'package:everest/Views/Models/profile_entry_model.dart';
import 'package:everest/Widgets/alert_dialogbox.dart';
import 'package:everest/Widgets/app_logo.dart';
import 'package:everest/Widgets/profile_entry_widget.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dashboard.dart';

/// Page for profile entry
///@author Manish Poudel
///@createdAt 9/23/2020

class ProfileEntryPage extends StatefulWidget {
  @override
  _ProfileEntryPageState createState() => _ProfileEntryPageState();
}

class _ProfileEntryPageState extends State<ProfileEntryPage> {
  ProfileEntryModel _profileEntryModel;
  firebase_auth.User _user;

  /// On profile saved call
  /// @param first name, last name, and gender of the user
  _onProfileSave(firstName, lastName, gender) {
    User user = User(
        id: _user.uid,
        emailId: _user.email,
        firstName: firstName,
        lastName: lastName,
        gender: gender);
    _profileEntryModel.saveProfile(user).then((value) {
      ViewUtility.pushReplacement(context, Dashboard());
    }).catchError((err) {
      DialogBox(
              context: context,
              heading: "Profile setup failure",
              content: "Something went wrong. Please try again.")
          .show();
    });
  }

  @override
  void initState() {
    super.initState();
    _profileEntryModel = ProfileEntryModel(context: context);
  }

  @override
  Widget build(BuildContext context) {
    _user = Provider.of<firebase_auth.User>(context, listen: false);
    var authService = Provider.of<FirebaseAuthService>(context, listen: false);
    final double standardPadding = ScreenUtility.getStandardPadding(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(context),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: ScreenUtility.getScreenWidth(context),
            color: Colors.white70,
            padding: EdgeInsets.only(
                left: standardPadding,
                right: standardPadding,
                top: ScreenUtility.getStatusBarHeight(context) * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLogo(),
                Padding(
                  padding: EdgeInsets.only(
                      left: standardPadding * 2,
                      right: standardPadding * 2,
                      top: standardPadding * 3),
                  child: ProfileEntryWidget(
                      firstNameValidator: _profileEntryModel.firstNameValidator,
                      lastNameValidator: _profileEntryModel.lastNameValidator,
                      onProfileSave: _onProfileSave),
                ),
                Padding(
                  padding: EdgeInsets.only(top: standardPadding),
                  child: FlatButton(
                    child: Text("Sign out"),
                    onPressed: () {
                      authService.signOut();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
