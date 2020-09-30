import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Services/Firebase/user.dart';
import 'package:everest/Services/Firebase/firebase_auth_service.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:everest/Utilities/view_utility.dart';
import 'package:everest/Views/Models/profile_entry_model.dart';
import 'package:everest/Widgets/alert_dialogbox.dart';
import 'package:everest/Widgets/app_logo.dart';
import 'package:everest/Widgets/profile_entry_widget.dart';
import 'package:everest/Widgets/progress_info_widget.dart';
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
  FirebaseAuthService _authService;
  double _standardPadding;
  AppConfig _appConfig;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _profileEntryModel = ProfileEntryModel(context: context);
  }

  /// On profile saved call
  /// @param first name, last name, and gender of the user
  _onProfileSave(name, username, gender) async {
    ProgressInfo progressInfo =
        ProgressInfo(context: context, content: "Saving your profile...");
    progressInfo.show();
    if(await _profileEntryModel.usernameExists(username))
      {
        progressInfo.dismiss();
        DialogBox(
            context: context,
            heading: "Profile setup failure",
            content: "Username already exists")
            .show();
        return;
      }
    User user = User(
        id: _user.uid,
        emailId: _user.email,
        name: name,
        username: username,
        profileCreatedAt: DateTime.now(),
        lastUpdated: {
          "username": DateTime.now(),
          "name": DateTime.now(),
        },
        userProfileUrl: "",
        gender: gender);
    _profileEntryModel.saveProfile(user).then((value) {
      progressInfo.dismiss();
    }).catchError((err) {
      progressInfo.dismiss();
      DialogBox(
              context: context,
              heading: "Profile setup failure",
              content: "Something went wrong. Please try again.")
          .show();
    });
  }

  @override
  Widget build(BuildContext context) {
    _user = Provider.of<firebase_auth.User>(context, listen: false);
    _authService = Provider.of<FirebaseAuthService>(context, listen: false);
    _standardPadding = ScreenUtility.getStandardPadding(context);
    _appConfig = Provider.of<AppConfig>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _appConfig.appTheme.getThemeData(context),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: ScreenUtility.getScreenWidth(context),
            color: Colors.white70,
            padding: EdgeInsets.only(
                left: _standardPadding,
                right: _standardPadding,
                top: ScreenUtility.getStatusBarHeight(context) * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLogo(),
                Padding(
                  padding: EdgeInsets.only(
                      left: _standardPadding * 2,
                      right: _standardPadding * 2,
                      top: _standardPadding * 3),
                  child: ProfileEntryWidget(
                      firstNameValidator: _profileEntryModel.firstNameValidator,
                      usernameValidator: _profileEntryModel.usernameValidator,
                      onProfileSave: _onProfileSave),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _standardPadding),
                  child: FlatButton(
                    child: Text("Sign out",
                        style: TextStyle(
                            fontFamily: _appConfig.fontFamily,
                            fontSize:
                                ScreenUtility.getStandardSize8(context) * 2,
                            decoration: TextDecoration.underline)),
                    onPressed: () {
                      _authService.signOut();
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
