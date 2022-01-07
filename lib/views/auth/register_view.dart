import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_home/core/view_model/auth/auth_provider.dart';
import 'package:mega_home/utils/constants/colors.dart';
import 'package:mega_home/utils/constants/routes.dart';
import 'package:mega_home/utils/constants/strings.dart';
import 'package:mega_home/views/payment/submit_credit_view.dart';
import 'package:mega_home/views/custom_widgets/custom_social_button.dart';
import 'package:mega_home/views/custom_widgets/custom_text_button.dart';
import 'package:mega_home/views/custom_widgets/custom_text_from_field.dart';
import 'package:mega_home/views/custom_widgets/horizontal_or_line.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final EdgeInsets _customPadding =
      const EdgeInsets.symmetric(vertical: 10, horizontal: 20);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthViewModel>(context, listen: false);
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
          color: btnBgColor,
        ),
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
                child: Column(
                  children: [
                    Container(
                        padding: _customPadding,
                        child: CustomTextFromField(
                          controller: _authProvider.nameController,
                          hint: 'Full name',
                          onSave: (save) {
                            if (save != null) {
                              _authProvider.name = save;
                            }
                          },
                          validator: (value) {
                            if (value == null || value == "" || value.isEmpty) {
                              print("Error");
                            } else {
                              return null;
                            }
                          },
                        )),
                    Container(
                        padding: _customPadding,
                        child: CustomTextFromField(
                          controller: _authProvider.emailController,
                          hint: 'Email',
                          onSave: (save) {
                            if (save != null) {
                              _authProvider.email = save;
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email is required";
                            } else {
                              return null;
                            }
                          },
                        )),
                    Container(
                        padding: _customPadding,
                        child: CustomTextFromField(
                          controller: _authProvider.passwordController1,
                          hint: 'Password',
                          obscure: true,
                          onSave: (String? value) {
                            _authProvider.password = value!;
                          },
                          validator: (value) {
                            return _authProvider.validatePassword(value!);
                          },
                        )),
                    Container(
                        padding: _customPadding,
                        child: CustomTextFromField(
                          controller: _authProvider.passwordController2,
                          hint: 'Renter the Password',
                          obscure: true,
                          onSave: (String? value) {
                            _authProvider.password = value!;
                          },
                          validator: (value) {
                            return _authProvider.validatePassword(value!);
                          },
                        )),
                  ],
                ),
              ),
              Container(
                padding: _customPadding,
                child: CustomTextButton(
                  onPress: () {
                    _authProvider.signUp();
                    Navigator.pushReplacementNamed(context, wrapperRoute);
                  },
                  title: "Next",
                ),
              ),
              Container(
                child: Column(
                  children: [
                    const HorizontalOrLine(label: "OR", height: 20),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: _screenWidth / 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomSocialButton(
                            onTap: () {},
                            path: "assets/icons/facebook.svg",
                          ),
                          CustomSocialButton(
                            onTap: () {},
                            path: "assets/icons/google.svg",
                          ),
                          CustomSocialButton(
                            onTap: () {},
                            path: "assets/icons/apple.svg",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
