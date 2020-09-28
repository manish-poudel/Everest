
import 'package:everest/Services/Firebase/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Drawer for dashboard
/// @createdAt 9/28/2020
/// @author Manish Poudel

class DashboardDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context, listen:true);
    return Drawer(

      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey[100]
            ),
            currentAccountPicture: Image.asset(""),
            accountName: Text(user.firstName + " " + user.lastName),
            accountEmail: Text(user.emailId),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
