import 'package:everest/AppConfig/AppConfig.dart';
import 'package:everest/Services/Firebase/User.dart';
import 'package:everest/Services/Firebase/firebase_auth_service.dart';
import 'package:everest/Services/Firebase/firestore_service.dart';
import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:everest/Views/dashboard_drawer.dart';
import 'package:everest/Views/home_page.dart';
import 'package:everest/Views/post_status_page.dart';
import 'package:everest/Views/profile_page.dart';
import 'package:everest/Views/setting_page.dart';
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
  AppConfig _appConfig;
  int _selectedIndex = 0;
  List<Widget> _pageOptions = <Widget>[
    HomePage(),
    PostStatusPage(),
    ProfilePage(),
  ];

  void _onBottomNavPageTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _appConfig = Provider.of<AppConfig>(context, listen: false);
    _appConfig.appTheme.setStatusBarTheme();
    return MaterialApp(
      theme: _appConfig.appTheme.getThemeData(context),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            actions: [
            IconButton(icon: Icon(Icons.settings), onPressed: () {
              var authService = Provider.of<FirebaseAuthService>(context,listen: false);
              authService.signOut();
            }),
            ],
            title: Text(
              "StatusQ",
              style: TextStyle(
                  fontFamily: _appConfig.fontFamily,
                  fontSize: ScreenUtility.getStandardSize8(context) * 2),
            ),
            elevation: 8,
          ),
          bottomNavigationBar: SizedBox(
            height: ScreenUtility.getScreenHeight(context) * 0.072,
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  title: Container(height: 0),
                  icon: Icon(Icons.home,
                      size: MediaQuery.of(context).size.height * 0.045),
                ),
                BottomNavigationBarItem(
                  title: Container(height: 0),
                  icon: Icon(Icons.add_circle_outline,
                      size: MediaQuery.of(context).size.height * 0.045),
                ),
                BottomNavigationBarItem(
                  title: Container(height: 0),
                  icon: Icon(Icons.account_circle,
                      size: MediaQuery.of(context).size.height * 0.045),
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onBottomNavPageTapped,
            ),
          ),
          body: Center(
            child: _pageOptions.elementAt(_selectedIndex),
          )),
    );
  }
}
