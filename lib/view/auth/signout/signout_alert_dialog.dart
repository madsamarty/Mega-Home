import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mega_home_graduation_project/core/view_model/auth_view_model.dart';
import 'package:mega_home_graduation_project/utils/constants/colors.dart';
import 'package:mega_home_graduation_project/view/custom_widgets/custom_text.dart';

class SignOutAlertDialog extends StatelessWidget {
  const SignOutAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const CustomText(title: 'Sign Out of App?'),
      content: const Text(
        'Are you sure that you would like to sign out?',
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Get.find<AuthViewModel>().signOut(),
          child: const Text('Sign Out'),
        ),
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
