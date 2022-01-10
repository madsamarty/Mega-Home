import 'package:flutter/material.dart';
import 'package:mega_home/core/view_model/authentication_provider.dart';
import 'package:mega_home/utils/constants/colors.dart';
import 'package:mega_home/utils/constants/strings.dart';
import 'package:mega_home/views/custom_widgets/custom_text.dart';
import 'package:provider/provider.dart';

class SignOutListTile extends StatelessWidget {
  const SignOutListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.exit_to_app),
        title: const Text(logout),
        onTap: () {
          Navigator.pop(context);
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const CustomText(title: 'Sign Out of App?'),
              content: const Text(
                'Are you sure that you would like to sign out?',
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Provider.of<AuthViewModel>(context, listen: false)
                        .signOut();
                  },
                  child: const Text('Sign Out'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          );
        });
  }
}
