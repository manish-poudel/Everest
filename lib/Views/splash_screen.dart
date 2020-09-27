import 'package:everest/Services/Firebase/firestore_service.dart';
import 'package:everest/Utilities/ViewUtility.dart';
import 'package:everest/Views/dashboard.dart';
import 'package:everest/Views/profile_entry_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {


  final BuildContext parentContext;
  SplashScreen(this.parentContext);

  /// Get profile of the user
  _checkForProfile(context)
  async {
    FirestoreService  firestoreService = Provider.of<FirestoreService>(context);
    bool profileExists = await firestoreService.checkIfProfileExists();
    !profileExists? ViewUtility.materialPushReplacement(parentContext, ProfileEntryPage()): ViewUtility.materialPushReplacement(parentContext, Dashboard());
  }

  @override
  Widget build(BuildContext context) {
    _checkForProfile(context);
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
