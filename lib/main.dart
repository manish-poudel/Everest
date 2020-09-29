import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/AppConfig/flavor.dart';
import 'package:everest/Services/Firebase/firebase_auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'AppTheme/app_theme.dart';
import 'AppTheme/app_theme_type.dart';
import 'file:///C:/Users/sharm/Documents/Projects/Omekus/Everest/everest/lib/StatusQApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Entry point for the production app
Future<void> main() async {
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      Provider<AppConfig>(
        create: (_) => AppConfig(
            fontFamily: 'Montserrat',
            appTheme: AppTheme(type: AppThemeType.light),
            apiBasePath: "",
            flavor: Flavor.prod),
      ),
      Provider<FirebaseAuthService>(create: (_) => FirebaseAuthService()),
    ],
    child: StatusQApp(),
  ));
}
