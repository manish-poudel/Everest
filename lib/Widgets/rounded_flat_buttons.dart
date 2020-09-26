import 'package:everest/AppConfig/AppConfig.dart';
import 'package:everest/Utilities/ScreenUtility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final bool enable;

  RoundedFlatButton(
      {@required this.text,
      @required this.width,
      @required this.onClick,
      @required this.backgroundColor,
      @required this.textColor,
      @required this.borderColor,
        @required this.enable,
      this.icon});
  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = Provider.of<AppConfig>(context);
    return FlatButton(
      disabledColor: Colors.grey,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: (enable == null || enable)?() => Function.apply(onClick, []):null,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(ScreenUtility.getStandardSize8(context)),
          side: BorderSide(color: (enable == null || enable)?borderColor:Colors.grey)),
      child: icon == null
          ?Padding(
          padding: EdgeInsets.all(ScreenUtility.getStandardPadding(context)),
          child:Center(
            child: Text(text,
                style: TextStyle(
                    fontSize: ScreenUtility.getStandardSize8(context) * 2,
                    fontFamily: appConfig.fontFamily,
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
                            fontFamily: appConfig.fontFamily,
                            color: textColor)),
                  ),
                )
              ],
            ),
    );
  }
}
