

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:mega_home_graduation_project/core/view_model/ProfileViewModel.dart';
import 'package:mega_home_graduation_project/view/custom_widgets/custom_data_row.dart';
import 'package:mega_home_graduation_project/view/custom_widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
        init: Get.find<ProfileViewModel>(),
        builder: (controller)=> Scaffold(
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
                    CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey.shade100,
                        backgroundImage:
                        const AssetImage('assets/images/alex.png'),
                    )
                    ,
                    const SizedBox(
                      height: 20,
                    ),
             CustomText(
              title: controller.userModel.name,
              alignment: Alignment.center,
              color: Colors.white,
              fontSize: 26,
            ),
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
                child:Column(
                  children: [
                    CustomDataRow(
                        dataKey: "NAME", value: "Alex Adams"),
                    CustomDataRow(
                        dataKey: "PHONE", value: "01155667788"),
                    CustomDataRow(
                        dataKey: "ADDRESS",
                        value: "333 E Wonderview Ave, Estes Park"),
                  ],
                )

              )
            ],
          ),
        ),
      ),
    ));
  }
}