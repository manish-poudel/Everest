import 'package:everest/AppConfig/AppConfig.dart';
import 'package:everest/AppConfig/Flavor.dart';
import 'package:everest/AppTheme/app_theme_type.dart';
import 'package:firebase_core/firebase_core.dart';
import 'AppTheme/app_theme.dart';
import 'Services/Firebase/firebase_auth_service.dart';
import 'file:///C:/Users/sharm/Documents/Projects/Omekus/Everest/everest/lib/StatusQApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Entry point of the dev app
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      Provider<AppConfig>(
        create: (_) => AppConfig(
            fontFamily: 'Montserrat',
            appTheme: AppTheme(type: AppThemeType.light),
            apiBasePath: "",
            flavor: Flavor.dev),
      ),
      Provider<FirebaseAuthService>(
          create: (_) => FirebaseAuthService()),
    ],
    child: StatusQApp(),
  ));
}


