import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Resources/app_image_resources.dart';
import 'package:everest/Services/Firebase/user.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:everest/Views/Models/search_page_model.dart';
import 'package:everest/Widgets/Models/search_box_filter_model.dart';
import 'package:everest/Widgets/Models/search_box_model.dart';
import 'package:everest/Widgets/search_box.dart';
import 'package:everest/Widgets/search_box_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Search page in the dashboard
/// @author Manish Poudel
/// @createdAt 9/28/2020

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  AppConfig _appConfig;
  SearchBoxModel _searchBoxModel;
  SearchPageModel _searchPageModel;
  SearchBoxFilterModel _searchBoxFilterModel;
  bool init = false;
  var consumer;
  @override
  void initState() {
    super.initState();
    _searchBoxModel = SearchBoxModel(context: context);
    _searchBoxFilterModel = SearchBoxFilterModel(_searchBoxModel);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (init == true) return;
    init = true;
    _searchPageModel = SearchPageModel(context);
    initTextFieldConsumer();
    init = true;
  }

  /// Init text field consumer which is the search result view
  initTextFieldConsumer() {
    consumer = Consumer<SearchBoxModel>(
      builder: (context, searchBoxModel, child) {
        return FutureBuilder<List<User>>(
          future: _searchPageModel.searchUser(
              searchBoxModel.searchText,
              _searchBoxFilterModel.filterUsernameActive,
              _searchBoxFilterModel.filterNameActive),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              List<User> users = snapshot.data;
              if (users.isEmpty) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtility.getStandardPadding(context)),
                  child: Text(
                    "No result found for " + searchBoxModel.searchText,
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              } else {
                return userListViewBuilder(users);
              }
            } else if (snapshot.hasError) {
              Text("Something went wrong..");
            }
            return Text("");
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _appConfig = Provider.of<AppConfig>(context, listen: false);
    _appConfig.appTheme.setStatusBarTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(
                  top: ScreenUtility.getStatusBarHeight(context)),
              child: Column(
                children: [
                  ChangeNotifierProvider.value(
                      value: _searchBoxModel,
                      child: Column(
                        children: [
                          Material(
                              color: Colors.white,
                              elevation: 2,
                              child: Column(
                                children: [
                                  SearchBox(),
                                  ChangeNotifierProvider.value(
                                      value: _searchBoxFilterModel,
                                      child: SearchBoxFilter()),
                                ],
                              )),
                          consumer
                        ],
                      )),
                ],
              )),
        ),
      ),
    );
  }

  /// Create list view for user search result
  Widget userListViewBuilder(List<User> users) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: users.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding:
                EdgeInsets.all(ScreenUtility.getStandardPadding(context) * 2),
            child: Row(
              children: [
                CircleAvatar(
                  radius: ScreenUtility.getScreenWidth(context) * 0.032,
                  backgroundImage: users[index].profileImageUrl.isEmpty
                      ? AssetImage(ImageResources.userPlaceholderImgPath)
                      : NetworkImage(users[index].profileImageUrl),
                  backgroundColor: Colors.transparent,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: ScreenUtility.getStandardPadding(context) * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        users[index].username,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        users[index].name,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
