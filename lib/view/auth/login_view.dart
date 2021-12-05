import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_home/core/view_model/auth_view_model.dart';
import 'package:mega_home/view/custom_widgets/custom_text_from_field.dart';

class LoginView extends GetWidget<AuthViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: CustomTextFromField(
                  controller: controller.emailController,
                  hint: 'Email',
                  onSave: (save) {},
                  validator: (validator) {},
                )),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: CustomTextFromField(
                  controller: controller.passwordController,
                  hint: 'Password',
                  onSave: (save) {},
                  validator: (validator) {},
                )),
          ],
        ),
      ),
    );
  }
}
