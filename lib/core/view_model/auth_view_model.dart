import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AuthViewModel extends GetxController {
  late TextEditingController emailController,
      passwordController,
      nameController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
  }
}
