import 'package:everest/Services/Firebase/Firestore/firestore_user_service.dart';
import 'package:everest/Services/Firebase/user.dart';
import 'package:everest/Views/dashboard.dart';
import 'package:everest/Views/profile_entry_page.dart';
import 'package:everest/Widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen();
  @override
  Widget build(BuildContext context) {
    FirestoreUserService firestoreService = Provider.of<FirestoreUserService>(context);
    return StreamBuilder<User>(
      stream: firestoreService.userStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User user = snapshot.data;
          print("rUN");
          if (user != null) {
            return MultiProvider(
              providers: [
                Provider<User>.value(value: user),
              ],
              child: Dashboard(),
            );
          }
          return ProfileEntryPage();
        }
        return Scaffold(
          body: Center(
            child: AppLogo(),
          ),
        );
      },
    );
  }
}
