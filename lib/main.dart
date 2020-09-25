import 'package:everest/AppConfig/AppConfig.dart';
import 'package:everest/AppConfig/Flavor.dart';
import 'package:everest/Views/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Resources/app_theme.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<AppConfig>(
        create: (_) => AppConfig(
            fontFamily: 'Montserrat',
            apiBasePath: "",
            flavor: Flavor.prod),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme.setStatusBarLightTheme();
    return MaterialApp(
        theme: AppTheme.light(context),
        debugShowCheckedModeBanner: false,
        home: IntroPage());
  }
}
