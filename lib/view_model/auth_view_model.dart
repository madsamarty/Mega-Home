import 'package:flutter/material.dart';

class AuthViewModel {
  late TextEditingController emailController,
      passwordController,
      nameController;

  AuthViewModel() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
  }
  /* @override
  void onInit() {
    // TODO: implement onInit
    //super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
  } */
  /* void initState() {
    //super.initState();
    
  } */
}
