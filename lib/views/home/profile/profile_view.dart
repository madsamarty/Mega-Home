import 'package:flutter/material.dart';
import 'package:mega_home/core/view_model/home_provider.dart';
import 'package:mega_home/core/view_model/profile_provider.dart';
import 'package:mega_home/model/user_model.dart';
import 'package:mega_home/views/custom_widgets/custom_text.dart';
import 'package:mega_home/views/home/main/home_view.dart';
import 'package:mega_home/views/custom_widgets/custom_data_row.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff121212),
        elevation: 0.0,
        title: const Text("Profile"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xff121212),
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height / 2.4,
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Consumer<ProfileProvider>(builder: (_, avatarImage, __) {
                      return CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey.shade100,
                        backgroundImage:
                            NetworkImage(avatarImage.userModel.pic),
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<ProfileProvider>(builder: (context, userName, _) {
                      return CustomText(
                        title: userName.userModel.name,
                        alignment: Alignment.center,
                        color: Colors.white,
                        fontSize: 26,
                      );
                    })
                  ],
                ),
              ),
              Container(
                height: 380,
                padding: const EdgeInsets.only(top: 40),
                decoration: const BoxDecoration(
                    color: Color(0xffE8E8E8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )),
                child:
                    Consumer<ProfileProvider>(builder: (context, userData, _) {
                  return Column(
                    children: [
                      CustomDataRow(
                          dataKey: "NAME", value: userData.userModel.name),
                      CustomDataRow(
                          dataKey: "PHONE", value: userData.userModel.phone),
                      CustomDataRow(
                          dataKey: "ADDRESS",
                          value: userData.userModel.address),
                      CustomDataRow(
                          dataKey: "RENEWAL DATE",
                          value: userData.userModel.renewalDate),
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
