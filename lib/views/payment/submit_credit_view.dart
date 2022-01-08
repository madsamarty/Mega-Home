import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_home/core/view_model/authentication_provider.dart';
import 'package:mega_home/utils/constants/colors.dart';
import 'package:mega_home/utils/constants/routes.dart';
import 'package:mega_home/utils/constants/strings.dart';
import 'package:mega_home/views/custom_widgets/custom_social_button.dart';
import 'package:mega_home/views/custom_widgets/custom_text_button.dart';
import 'package:mega_home/views/custom_widgets/custom_text_from_field.dart';
import 'package:mega_home/views/custom_widgets/horizontal_or_line.dart';
import 'package:provider/provider.dart';

class SubmitCredit extends StatelessWidget {
  const SubmitCredit({Key? key}) : super(key: key);
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
                        controller: authViewModel.cardNumberController,
                        hint: 'Card number',
                        onSave: (save) {},
                        validator: (validator) {},
                      )),
                  Container(
                      padding: _customPadding,
                      child: CustomTextFromField(
                        controller: authViewModel.cardNameController,
                        hint: 'Name',
                        onSave: (save) {},
                        validator: (validator) {},
                      )),
                  Container(
                      padding: _customPadding,
                      child: CustomTextFromField(
                        controller: authViewModel.expDateController,
                        hint: 'Expired date',
                        onSave: (save) {},
                        validator: (validator) {},
                      )),
                  Container(
                      padding: _customPadding,
                      child: CustomTextFromField(
                        controller: authViewModel.secCodeController,
                        hint: 'Security code',
                        onSave: (save) {},
                        validator: (validator) {},
                      )),
                  /* SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ), */
                ],
              ),
            ),
            Container(
              padding: _customPadding,
              child: CustomTextButton(
                onPress: () {
                  authViewModel.submitCredit();
                  //Navigator.pushNamed(context, wrapperRoute);
                },
                title: "Register",
              ),
            ),
            /* Container(
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
            ) */
          ],
        ),
      ),
    );
  }
}
