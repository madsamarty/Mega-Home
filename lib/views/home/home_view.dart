import 'package:flutter/material.dart';
import 'package:mega_home/utils/constance.dart';
import 'package:mega_home/views/custom_widgets/custom_status_card.dart';
import 'package:mega_home/views/custom_widgets/custom_text.dart';
import 'package:mega_home/views/nav_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: btnBgColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                //padding: const EdgeInsets.only(bottom: 30),
                child: Image.asset("assets/logos/mega_word.png"),
              ),
            ),
            Expanded(
              flex: 3,
              //padding: const EdgeInsets.all(15),
              child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: List.generate(4, (index) {
                    return CustomStatusCard();
                  })),
            ),
            Expanded(
              flex: 1,
              child: Container(
                //padding: const EdgeInsets.symmetric(vertical: 80),
                child: const CustomText(
                  title: "Everything Is Okay",
                  alignment: Alignment.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
