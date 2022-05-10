import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mega_home_graduation_project/core/view_model/auth_view_model.dart';
import 'package:mega_home_graduation_project/model/security_model.dart';
import 'package:mega_home_graduation_project/view/auth/app-controller.dart';
import 'package:mega_home_graduation_project/view/auth/login_page.dart';
import 'package:mega_home_graduation_project/view/sec_app/security_home_view.dart';
import 'package:mega_home_graduation_project/view/user_app/main/home_view.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginPage()
          : appChoose();
    });
  }

  appChoose(){
    if(Get.find<AuthViewModel>().authDropdownValue == "User"){
      return HomeView();
    }else{
      return SecurityHomeView();
    }
  }
  }

