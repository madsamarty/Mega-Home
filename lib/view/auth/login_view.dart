import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_home/constance.dart';
import 'package:mega_home/core/view_model/auth_view_model.dart';
import 'package:mega_home/view/custom_widgets/custom_text_button.dart';
import 'package:mega_home/view/custom_widgets/custom_text_from_field.dart';
import 'package:mega_home/view/custom_widgets/horizontal_or_line.dart';

class LoginView extends GetWidget<AuthViewModel> {
  LoginView({Key? key}) : super(key: key);
  final EdgeInsets _customPadding =
      const EdgeInsets.symmetric(vertical: 10, horizontal: 20);

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: _screenHeight / 3,
            ),
            Container(
                padding: _customPadding,
                child: CustomTextFromField(
                  controller: controller.emailController,
                  hint: 'Email',
                  onSave: (save) {},
                  validator: (validator) {},
                )),
            Container(
                padding: _customPadding,
                child: CustomTextFromField(
                  controller: controller.passwordController,
                  hint: 'Password',
                  onSave: (save) {},
                  validator: (validator) {},
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Container(
              padding: _customPadding,
              child: CustomTextButton(
                onPress: () {},
                title: "Sign In",
              ),
            ),
            Container(
              padding: _customPadding,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: btnBgColor)),
                child: CustomTextButton(
                  onPress: () {},
                  title: "Register",
                  backgroundColor: Colors.transparent,
                  textColor: btnBgColor,
                ),
              ),
            ),
            const HorizontalOrLine(label: "OR", height: 20)
          ],
        ),
      ),
    );
  }
}
