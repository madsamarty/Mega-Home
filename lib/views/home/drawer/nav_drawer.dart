import 'package:flutter/material.dart';
import 'package:mega_home/core/view_model/authentication_provider.dart';
import 'package:mega_home/utils/constants/strings.dart';
import 'package:mega_home/views/home/profile/profile_view.dart';
import 'package:mega_home/views/home/drawer/sign_out_alert_dialog.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(profile),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileView()))
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text(settings),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(messages),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: const Icon(Icons.support),
              title: Text(support),
              onTap: () => {Navigator.of(context).pop()},
            ),
            const SignOutListTile()
          ],
        ),
      ),
    );
  }
}
