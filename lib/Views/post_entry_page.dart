import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:everest/Widgets/Models/Post/post_entry_model.dart';
import 'package:everest/Widgets/Models/Post/post_entry_view_enum.dart';
import 'package:everest/Widgets/Models/Post/post_security_option_model.dart';
import 'package:everest/Widgets/Post/post_entry_main_widget.dart';
import 'package:everest/Widgets/Post/post_security_option_widget.dart';
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
  PostSecurityOptionModel _postSecurityOptionModel;
  PostEntryMainModel _postEntryMainModel;

  @override
  void initState() {
    super.initState();
    _postSecurityOptionModel = PostSecurityOptionModel();
    _postEntryMainModel = PostEntryMainModel();
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
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.close),
                                  color: Colors.white,
                                  onPressed: () => Navigator.of(context).pop()),
                              Text(
                                "Post",
                                style: TextStyle(
                                    fontFamily: _appConfig.fontFamily,
                                    fontSize: ScreenUtility.getStandardSize8(
                                            context) *
                                        2),
                              ),
                            ],
                          ),
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
                  ChangeNotifierProvider.value(
                      value: _postSecurityOptionModel,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PostSecurityOptionWidget(),
                          Consumer<PostSecurityOptionModel>(
                              builder: (context, model, child) {
                            return Text(
                                model.securityOptionSelected == "Public"
                                    ? "* Your post will be visible to all."
                                    : "* Your post will be visible to only your admirer.",
                                style: TextStyle(
                                    fontFamily: _appConfig.fontFamily,
                                    color: Colors.grey));
                          })
                        ],
                      )),
                  Container(
                    child: ChangeNotifierProvider.value(
                        value: _postEntryMainModel,
                        child: Column(
                          children: [
                            PostEntryMainWidget(),
                            Padding(
                              padding:  EdgeInsets.only(top:ScreenUtility.getStandardPadding(context) * 3),
                              child: Consumer<PostEntryMainModel>(
                                  builder: (context, model, child) {
                                return getPostButtons(model);
                              }),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  /// Get buttons
  Widget getPostButtons(model) {
    if (model.postEntryView == PostEntryView.activity) {
      return Align(
        alignment: Alignment.bottomRight,
        child: FlatButton(
          onPressed: () => model.changeView(PostEntryView.imageAndNote),
          child:
              Text("NEXT", style: TextStyle(fontFamily: _appConfig.fontFamily)),
        ),
      );
    }
    if (model.postEntryView == PostEntryView.imageAndNote) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton(
            onPressed: () => model.changeView(PostEntryView.activity),
            child: Text("BACK",
                style: TextStyle(fontFamily: _appConfig.fontFamily)),
          ),
          FlatButton(
            onPressed: () => model.changeView(PostEntryView.changeStatus),
            child: Text("NEXT",
                style: TextStyle(fontFamily: _appConfig.fontFamily)),
          ),
        ],
      );
    }
    if (model.postEntryView == PostEntryView.changeStatus) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton(
            onPressed: () => model.changeView(PostEntryView.imageAndNote),
            child: Text("BACK",
                style: TextStyle(fontFamily: _appConfig.fontFamily)),
          ),
          FlatButton(
            onPressed: () => null,
            child: Text("POST",
                style: TextStyle(fontFamily: _appConfig.fontFamily)),
          ),
        ],
      );
    }
    return Container(height: 0, width: 0);
  }
}
