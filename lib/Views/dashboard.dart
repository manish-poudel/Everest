import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Services/Firebase/Firestore/firestore_user_service.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:everest/Utilities/view_utility.dart';
import 'package:everest/Views/home_page.dart';
import 'package:everest/Views/post_status_page.dart';
import 'package:everest/Views/profile_page.dart';
import 'package:everest/Views/search_page.dart';
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
    SearchPage(),
    PostStatusPage(),
    SettingPage(),
    ProfilePage(),
  ];

  List<String> _pageTitle = [
    "StatusQ",
    "Search",
    "Post",
    "Notifications",
    "Profile"
  ];

  void _onBottomNavPageTapped(int index) {
    if (index == 1) {
      ViewUtility.materialPush(context, _pageOptions[index]);
      return;
    }
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
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(ScreenUtility.getScreenHeight(context) * 0.08),
            child: AppBar(
              flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(
                      top: ScreenUtility.getStatusBarHeight(context)),
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: ScreenUtility.getStandardSize8(context) * 2),
                      child: Container(
                        child: Row(
                          children: [
                            Text(
                              _pageTitle[_selectedIndex],
                              style: TextStyle(
                                  fontFamily: _appConfig.fontFamily,
                                  fontSize:
                                      ScreenUtility.getStandardSize8(context) *
                                          2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              elevation: 8,
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: ScreenUtility.getScreenHeight(context) * 0.072,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  title: Container(height: 0),
                  icon: Icon(Icons.home,
                      size: MediaQuery.of(context).size.height * 0.045),
                ),
                BottomNavigationBarItem(
                  title: Container(height: 0),
                  icon: Icon(Icons.search,
                      size: MediaQuery.of(context).size.height * 0.045),
                ),
                BottomNavigationBarItem(
                  title: Container(height: 0),
                  icon: Icon(Icons.add_circle_outline,
                      size: MediaQuery.of(context).size.height * 0.045),
                ),
                BottomNavigationBarItem(
                  title: Container(height: 0),
                  icon: Icon(Icons.notifications,
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
