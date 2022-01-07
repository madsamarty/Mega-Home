import 'dart:convert';

import 'package:mega_home/model/user_model.dart';
import 'package:mega_home/utils/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesData {
  Future<UserModel?> get getUser async {
    try {
      UserModel? cachedUserModel = await _getUserData();
      if (cachedUserModel == null) {
        print("No User...");
      } else {
        return cachedUserModel;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //// SHARED PREFS ////
  ///
  ///
  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = prefs.getString(CACHED_USER_DATA);
    return UserModel.fromJson(json.decode(user!));
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(CACHED_USER_DATA, json.encode(userModel.toJson()));
  }

  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('userId').toString();
    return id;
  }

  deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
