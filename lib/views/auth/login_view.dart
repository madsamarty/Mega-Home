import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_home/utils/constance.dart';
import 'package:mega_home/view_model/auth_view_model.dart';
import 'package:mega_home/views/auth/register_view_step1.dart';
import 'package:mega_home/views/custom_widgets/custom_social_button.dart';
import 'package:mega_home/views/custom_widgets/custom_text_button.dart';
import 'package:mega_home/views/custom_widgets/custom_text_from_field.dart';
import 'package:mega_home/views/custom_widgets/horizontal_or_line.dart';
import 'package:mega_home/views/home/home_view.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  final EdgeInsets _customPadding =
      const EdgeInsets.symmetric(vertical: 10, horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
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
                    controller: authViewModel.emailController,
                    hint: 'Email',
                    onSave: (save) {},
                    validator: (validator) {},
                  ),
                ),
                Padding(
                  padding: _customPadding,
                  child: CustomTextFromField(
                    controller: authViewModel.passwordController,
                    hint: 'Password',
                    onSave: (save) {},
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomeView()));
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => RegisterView1()));
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
                    padding: EdgeInsets.symmetric(horizontal: _screenWidth / 4),
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
    );
  }
}
