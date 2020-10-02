import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:everest/Widgets/post_entry_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Post status page in the dashboard
/// @author Manish Poudel
/// @createdAt 9/27/2020

class PostEntryPage extends StatefulWidget {
  @override
  _PostEntryPageState createState() => _PostEntryPageState();
}

class _PostEntryPageState extends State<PostEntryPage> {
  AppConfig _appConfig;

  @override
  Widget build(BuildContext context) {
    print("Post");
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
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Row(
                            children: [
                              IconButton(icon: Icon(Icons.close), color: Colors.white,onPressed: ()=> Navigator.of(context).pop()),
                              Text(
                                "Post",
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
                      Padding(
                        padding:  EdgeInsets.only(right:ScreenUtility.getStandardPadding(context) * 2),
                        child: Text(
                          "Share",
                          style: TextStyle(
                            color: Colors.white,
                              fontFamily: _appConfig.fontFamily,
                              fontWeight: FontWeight.w700,
                              fontSize:
                              ScreenUtility.getStandardSize8(context) *
                                  2),
                        ),
                      ),
                    ],
                  )),
              elevation: 8,
            ),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: ScreenUtility.getStandardPadding(context),
                  right: ScreenUtility.getStandardPadding(context) * 2,
                  left: ScreenUtility.getStandardPadding(context) * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PostEntryWidget()],
              ),
            ),
          )),
    );
  }
}
