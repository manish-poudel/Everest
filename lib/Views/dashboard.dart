import 'package:flutter/material.dart';

/// Dashboard page
///@author Manish Poudel
///@createdAt 9/25/2020
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(child: Text("dashboard")),
      ),
    );
  }
}
