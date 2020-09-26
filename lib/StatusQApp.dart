import 'package:everest/Resources/app_theme.dart';
import 'package:everest/Views/dashboard.dart';
import 'package:everest/Widgets/auth_widget.dart';
import 'package:everest/Widgets/auth_widget_builder.dart';
import 'package:flutter/material.dart';

/// Starting view of the app
class StatusQApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthWidgetBuilder(builder: (context, userSnapshot) {
      return MaterialApp(
          routes:{
            '/dashboard': (context) => Dashboard()
          },
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(context),
          home: AuthWidget(userSnapshot: userSnapshot)
      );
    });
  }
}
