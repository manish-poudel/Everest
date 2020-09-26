import 'package:everest/Services/Firebase/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Dashboard page
///@author Manish Poudel
///@createdAt 9/25/2020
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  FirebaseAuthService authService;
  @override
  void initState() {
    super.initState();
     authService = Provider.of<FirebaseAuthService>(context, listen: false);
  }

  signOut()
  {
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Container(child: FlatButton(
          child: Text("Logout"),
          onPressed: signOut
        ))),
      ),
    );
  }


}
