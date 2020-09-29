import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Widgets/auth_widget.dart';
import 'package:everest/Widgets/auth_widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Starting view of the app
class StatusQApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = Provider.of<AppConfig>(context, listen: false);
    return AuthWidgetBuilder(builder: (context, userSnapshot) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appConfig.appTheme.getThemeData(context),
          home: AuthWidget(userSnapshot: userSnapshot));
    });
  }
}
