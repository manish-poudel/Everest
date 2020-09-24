
import 'package:everest/Views/intro_page.dart';
import 'package:flutter/material.dart';
import 'Resources/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = "Login Page";

  @override
  Widget build(BuildContext context) {
    AppTheme.setStatusBarLightTheme();
    return MaterialApp(
      theme: AppTheme.light(context),
      debugShowCheckedModeBanner: false,
      title: _title,
      home: IntroPage(),
    );
  }
}
