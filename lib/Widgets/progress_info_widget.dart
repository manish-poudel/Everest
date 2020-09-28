import 'package:everest/AppConfig/AppConfig.dart';
import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Widget for progress information
/// @author Manish Poudel
/// @createdAt 9/27/2020

class ProgressInfo{
  BuildContext context;
  BuildContext dbContext;
  String content;
  ProgressInfo(
      {@required this.context, this.content});

  /// Show dialog box
  show() {
    AppConfig appConfig = Provider.of<AppConfig>(context, listen: false);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        this.dbContext = context;
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.only(left:ScreenUtility.getStandardPadding(context)),
                child: Text(content,
                    style: TextStyle(
                        fontSize: ScreenUtility.getStandardSize8(context) * 2,
                        fontFamily: appConfig.fontFamily)),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Dismiss dialog box
  dismiss()
  {
    Navigator.pop(dbContext);
  }
}