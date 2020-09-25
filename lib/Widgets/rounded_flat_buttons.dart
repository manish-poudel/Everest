import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Class that provides button
/// @author Manish Poudel
/// @createdAt 9/24/2020
class RoundedFlatButton extends StatelessWidget {
  final String text;
  final double width;
  final Function onClick;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final Icon icon;

  RoundedFlatButton(
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
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () => Function.apply(onClick, []),
      color: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(ScreenUtility.getStandardSize8(context)),
          side: BorderSide(color: borderColor)),
      child: icon == null
          ?Padding(
          padding: EdgeInsets.all(8),
          child:Center(
            child: Text(text,
                style: TextStyle(
                    fontSize: ScreenUtility.getStandardSize8(context) * 2,
                    fontFamily: 'Montserrat',
                    color: textColor)),
          ))
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Padding(
                  padding:  EdgeInsets.all(ScreenUtility.getStandardPadding(context)),
                  child: Center(
                    child: Text(text,
                        style: TextStyle(
                            fontSize:
                                ScreenUtility.getStandardSize8(context) * 2,
                            fontFamily: 'Montserrat',
                            color: textColor)),
                  ),
                )
              ],
            ),
    );
  }
}
