import 'package:everest/AppConfig/AppConfig.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Widget to show alert dialog box with custom strings
/// @author Manish Poudel
/// @createdAt 9/25/2020
class DialogBox {
  BuildContext context;
  BuildContext dbContext;
  String heading;
  String content;
  DialogBox(
      {@required this.context, @required this.heading, @required this.content});

  /// Show dialog box
  show() {
    AppConfig appConfig = Provider.of<AppConfig>(context, listen: false);
    Widget okButton = FlatButton(
      child:
          Text("OK", style: TextStyle(color: appConfig.appTheme.primaryColor)),
      onPressed: () {
        Navigator.pop(dbContext);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(heading, style: TextStyle(fontFamily: appConfig.fontFamily)),
      content: Text(content,
          style: TextStyle(
              fontSize: ScreenUtility.getStandardSize8(context) * 1.6,
              fontFamily: appConfig.fontFamily)),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        this.dbContext = context;
        return alert;
      },
    );
  }
}
