import 'package:everest/Services/Firebase/User.dart';
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
  _getProfile(context)
  async {
    FirestoreService  firestoreService = Provider.of<FirestoreService>(context);
    Map<String, dynamic> profileMap = await firestoreService.getProfileMap();
    if(profileMap == null)
    {
      ViewUtility.pushReplacement(parentContext, ProfileEntryPage());
    }
    else{
      User _user = Provider.of<User>(context, listen: false);
       _user.updateUserFromMap(profileMap);
       ViewUtility.pushReplacement(parentContext, Dashboard());
    }
  }

  @override
  Widget build(BuildContext context) {
    _getProfile(context);
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
