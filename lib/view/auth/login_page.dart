import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_home_graduation_project/core/view_model/auth_view_model.dart';
import 'package:mega_home_graduation_project/view/custom_widgets/custom_text.dart';
import 'package:mega_home_graduation_project/view/sec_app/security_home_view.dart';
import 'package:mega_home_graduation_project/view/user_app/main/home_view.dart';

import '../../utils/constants/colors.dart';

import '../custom_widgets/custom_text_button.dart';
import '../custom_widgets/custom_text_from_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final EdgeInsets _customPadding =
      const EdgeInsets.symmetric(vertical: 10, horizontal: 20);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
        init: Get.find<AuthViewModel>(),
        builder: (controller) => Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              body: Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Image.asset("assets/logos/mega.png"),
                      ),
                      Container(
                          //padding: _customPadding,
                          child: Column(
                        children: [
                          Padding(
                            padding: _customPadding,
                            child: CustomTextFromField(
                              controller: controller.emailController,
                              hint: 'Email',
                              onSave: (save) {
                                controller.email = save!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter email";
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: _customPadding,
                            child: CustomTextFromField(
                              controller: controller.passwordController,
                              hint: 'Password',
                              obscure: true,
                              onSave: (save) {
                                controller.password = save!;
                              },
                              validator: (validator) {},
                            ),
                          ),
                          Container(
                            padding: _customPadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomText(
                                  title: "Choose your account type",
                                ),
                                DropdownButton(
                                  onChanged: (newValue) {
                                    controller.setSelected(newValue);
                                  },
                                  value: controller.authDropdownValue,
                                  items: controller.authDropdownList
                                      .map((selectedType) {
                                    return DropdownMenuItem(
                                      child: Text(
                                        selectedType,
                                      ),
                                      value: selectedType,
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                      Container(
                        padding: _customPadding,
                        child: Column(
                          children: [
                            CustomTextButton(
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  controller.signInWithEmailAndPassword();
                                }
                              },
                              title: "Sign In",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(2),
                            //       border: Border.all(color: btnBgColor)),
                            //   child: CustomTextButton(
                            //     onPress: () {
                            //       //Get.offAll(HomeView());
                            //       Get.offAll(HomeView());
                            //     },
                            //     title: "Register",
                            //     backgroundColor: Colors.transparent,
                            //     textColor: btnBgColor,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
