import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_home_graduation_project/helper/check_connection.dart';
import 'package:mega_home_graduation_project/helper/local_storage_data.dart';
import 'package:mega_home_graduation_project/model/user_model.dart';

class ProfileViewModel extends GetxController{

  final LocalStorageData localStorageData = Get.find();

  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  UserModel _userModel = UserModel();
  UserModel get userModel => _userModel;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }

  void getCurrentUser() async {
    _loading.value = true;
    await localStorageData.getUser.then((value) {
      _userModel = value!;
    });
    _loading.value = false;
    update();
  }

}