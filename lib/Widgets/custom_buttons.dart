import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:flutter/material.dart';

/// Class that provides button
/// @author Manish Poudel
/// @createdAt 9/24/2020
class CustomRoundedButton extends StatelessWidget {
  final String text;
  final double width;
  final Function onClick;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final Icon icon;

  CustomRoundedButton(
      {@required this.text,
      @required this.width,
      @required this.onClick,
      @required this.backgroundColor,
      @required this.textColor,
      @required this.borderColor,
      this.icon});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Function.apply(onClick, []),
      color: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(ScreenUtility.getStandardSize8(context)),
          side: BorderSide(color: borderColor)),
      child: Container(
          width: width,
          child: Center(
              child: icon == null
                  ? Padding(
                    padding:  EdgeInsets.all(ScreenUtility.getStandardSize8(context)),
                    child: Text(text,
                        style: TextStyle(
                            fontSize: ScreenUtility.getStandardSize8(context) * 2,
                            fontFamily: 'Montserrat',
                            color: textColor)),
                  )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon,
                        Padding(
                          padding: EdgeInsets.only(left: ScreenUtility.getStandardSize8(context),
                            top: ScreenUtility.getStandardSize8(context), bottom: ScreenUtility.getStandardSize8(context) ),
                          child: Text(text,
                              style: TextStyle(
                                  fontSize:
                                      ScreenUtility.getStandardSize8(context) * 2,
                                  fontFamily: 'Montserrat',
                                  color: textColor)),
                        )
                      ],
                    ))),
    );
  }
}
