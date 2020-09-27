import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Screen utility class that provides helper function related to pages
/// @author Manish Poudel
/// @createdAt 9/24/2020

class ViewUtility {
  ///Navigate to a page using default page route
  static void cupertinoPush(BuildContext context, Widget page) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
  }

  ///Navigate to a page using default page route
  static void cupertinoPushReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => page));
  }

  ///Navigate to a page using default page route
  static void materialPush(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  ///Navigate to a page using default page route
  static void materialPushReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }
}
