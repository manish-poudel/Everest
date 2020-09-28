import 'package:everest/Services/Firebase/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: _buildUserInfo(context: context),
    );
  }
}

Widget _buildUserInfo({BuildContext context}) {
  final user = Provider.of<User>(context, listen: false);
  return (Column(
    children: [
      Text(user.id),
      Text(user.firstName),
      Text(user.lastName),
      Text(user.emailId),
      Text(user.gender),
    ],
  ));
}
