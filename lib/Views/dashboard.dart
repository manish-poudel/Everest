import 'package:everest/Services/Firebase/User.dart';
import 'package:everest/Services/Firebase/firebase_auth_service.dart';
import 'package:everest/Services/Firebase/firestore_service.dart';
import 'package:flutter/cupertino.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildUserInfo(context:context),
              Padding(
                padding: EdgeInsets.all(24),
                  child: Text("Logout", style: TextStyle(color: Colors.red),)),
            ],
          ),
          onPressed: signOut
        ))),
      ),
    );
  }

  Widget _buildUserInfo({BuildContext context}) {
    final database = Provider.of<FirestoreService>(context, listen: false);
    return StreamBuilder<User>(
      stream: database.userStream(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        if(snapshot.connectionState == ConnectionState.active)
          {
            return(Column(
              children: [
                Text(user.id),
                Text(user.firstName),
                Text(user.lastName),
                Text(user.emailId),
                Text(user.gender),
              ],
            ));
          }
      return Text("Getting profile");
      },
    );
  }

}
