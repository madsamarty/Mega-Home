import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_home_graduation_project/core/view_model/auth_view_model.dart';
import 'package:mega_home_graduation_project/view/sec_app/security_home_view.dart';
import 'package:mega_home_graduation_project/view/user_app/main/home_view.dart';

class AppController extends StatelessWidget {
  const AppController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().authDropdownValue == "User")
          ? HomeView()
          : SecurityHomeView();
    });
  }
}
