import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_home/core/view_model/auth/auth_provider.dart';
import 'package:mega_home/utils/constants/colors.dart';
import 'package:mega_home/utils/constants/routes.dart';
import 'package:mega_home/utils/constants/strings.dart';
import 'package:mega_home/views/auth/register_view.dart';
import 'package:mega_home/views/custom_widgets/custom_social_button.dart';
import 'package:mega_home/views/custom_widgets/custom_text_button.dart';
import 'package:mega_home/views/custom_widgets/custom_text_from_field.dart';
import 'package:mega_home/views/custom_widgets/horizontal_or_line.dart';
import 'package:mega_home/views/home/home_view.dart';
import 'package:mega_home/wrapper.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
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
                      controller: _authProvider.emailController,
                      hint: 'Email',
                      onSave: (save) {
                        _authProvider.email = save!;
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
                      controller: _authProvider.passwordController1,
                      hint: 'Password',
                      onSave: (save) {
                        _authProvider.password = save!;
                      },
                      validator: (validator) {},
                    ),
                  ),
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
                          _authProvider.signIn();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Wrapper()));
                        }
                      },
                      title: "Sign In",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: btnBgColor)),
                      child: CustomTextButton(
                        onPress: () {
                          Navigator.pushNamed(context, register1Route);
                        },
                        title: "Register",
                        backgroundColor: Colors.transparent,
                        textColor: btnBgColor,
                      ),
                    ),
                  ],
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
