import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_home_graduation_project/core/view_model/auth_view_model.dart';
import 'package:mega_home_graduation_project/view/auth/signout/signout_alert_dialog.dart';
import 'package:mega_home_graduation_project/view/user_app/nav_drawer/messages/messages_view.dart';
import 'package:mega_home_graduation_project/view/user_app/nav_drawer/support/support_view.dart';


import '../../../utils/constants/strings.dart';

class SecurityNavDrawer extends StatelessWidget {
  const SecurityNavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 45,
                ),
                ListTile(
                    title: const Text('SUPPORT',
                        style: TextStyle(
                          fontSize: 25,
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SupportView()));
                    }),
                GetBuilder<AuthViewModel>(
                  init: Get.find<AuthViewModel>(),
                  builder:(controller)=> ListTile(
                      title: const Text('LOGOUT',
                          style: TextStyle(
                            fontSize: 25,
                          )),
                      onTap: () {
                        showDialog<String>(context: context, builder:(BuildContext context)=> SignOutAlertDialog());
                      }),
                ),
                const SizedBox(
                  height: 300,
                ),
                const Text(
                  ' M   E   G   A',
                  style: TextStyle(color: Colors.black, fontSize: 35),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
