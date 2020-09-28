import 'package:flutter/material.dart';

/// Home page in the dashboard
/// @author Manish Poudel
/// @createdAt 9/27/2020

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Text("Post"),
      )
    );
  }
}

