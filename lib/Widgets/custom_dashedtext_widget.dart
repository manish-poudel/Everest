import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:flutter/material.dart';

/// Class that text in between dashed lines
/// @author Manish Poudel
/// @createdAt 9/24/2020

class CustomDashedTextWidget extends StatelessWidget {

  final String text;
  final double lineHeight;
  final double lineWidth;

  CustomDashedTextWidget({@required this.text, @required this.lineHeight, @required this.lineWidth});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 12, right: 15.0),
            child: Divider(
              color: Colors.black,
              height: lineHeight,
            )),
      ),
      Text(text,style: TextStyle(color:Colors.grey, fontFamily: 'Montserrat', fontSize: ScreenUtility.getStandardSize8(context) * 2)),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 15.0, right: 12),
            child: Divider(
              color: Colors.black,
              height: lineWidth,
            )),
      ),
    ]);
  }
}
