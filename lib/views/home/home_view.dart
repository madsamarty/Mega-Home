import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'package:mega_home/utils/constants/colors.dart';
import 'package:mega_home/views/auth/login_view.dart';
import 'package:mega_home/views/custom_widgets/custom_sensor_card.dart';
import 'package:mega_home/views/custom_widgets/custom_text.dart';
import 'package:mega_home/views/home/drawer/nav_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => context.watch<User?>() == null
      ? LoginView()
      : Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: NavDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            foregroundColor: btnBgColor,
          ),
          body: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //padding: const EdgeInsets.only(bottom: 30),
                  child: Image.asset("assets/logos/mega_word.png"),
                ),
                Container(
                  height: 380,
                  child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: List.generate(4, (index) {
                        return const CustomSensorCard();
                      })),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: const CustomText(
                    title: "Everything Is Okay",
                    alignment: Alignment.center,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        );
}
