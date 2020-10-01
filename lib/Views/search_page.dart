import 'package:everest/AppConfig/app_config.dart';
import 'package:everest/Services/Firebase/Cloud%20Functions/cloud_subdirectory_resources.dart';
import 'package:everest/Services/Firebase/Cloud%20Functions/firebase_cloud_function_service.dart';
import 'package:everest/Services/Firebase/user.dart';
import 'package:everest/Utilities/screen_utility.dart';
import 'package:everest/Widgets/Models/search_box_model.dart';
import 'package:everest/Widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  FirebaseCloudFunctionService cloudService;

  @override
  void initState() {
    super.initState();
  }

@override
  void didChangeDependencies() {
    super.didChangeDependencies();
     cloudService = Provider.of<FirebaseCloudFunctionService>(context, listen: false);
    _searchBoxModel = SearchBoxModel(context: context);
  }

  search()
  async {
     await cloudService.get(subDirectory: APISubDirectory.searchAllUser("ash", "",""));
  }

  @override
  Widget build(BuildContext context) {
    search();
    _appConfig = Provider.of<AppConfig>(context, listen: false);
    _appConfig.appTheme.setStatusBarTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding:
                EdgeInsets.only(top: ScreenUtility.getStatusBarHeight(context)),
            child: Column(
              children: [
                ChangeNotifierProvider.value(
                    value: _searchBoxModel,
                    child: Material(elevation: 2, child: SearchBox())),
              ],
            )),
      ),
    );
  }
}
