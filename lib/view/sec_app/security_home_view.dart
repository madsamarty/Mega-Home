import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mega_home_graduation_project/core/view_model/sec_view_model.dart';
import 'package:mega_home_graduation_project/utils/constants/strings.dart';
import 'package:mega_home_graduation_project/view/custom_widgets/custom_sec_card.dart';

class SecurityHomeView extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  @override
  Widget build(BuildContext context) {
    final SecViewModel landingPageController =
        Get.put(SecViewModel(), permanent: false);
    return GetBuilder<SecViewModel>(
        builder: (controller) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          drawer: Drawer(),
              body: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'MEGA',
                        style: TextStyle(fontSize: 50),
                      ),
                      IndexedStack(
                        index: landingPageController.tabIndex,
                        children: [
                          CustomSecCard(sensorIcon: policeIcon, sensorName: "THEFT ALARM"),
                          CustomSecCard(sensorIcon: gasIcon, sensorName: "GAS ALARM"),
                          CustomSecCard(sensorIcon: waterIcon , sensorName: "WATER ALARM"),
                          CustomSecCard(sensorIcon: fireExtinguisherIcon, sensorName: "FIRE ALARM"),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: SvgPicture.asset(
                  policeIcon,
                  color: Colors.black,
                  width: 30,
                  height: 30,
                ),
                label: 'Police',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  gasIcon,
                  color: Colors.black,
                  width: 30,
                  height: 30,
                ),
                label: 'Fire',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  waterIcon,
                  color: Colors.black,
                  width: 30,
                  height: 30,
                ),
                label: 'Gas',
              ),
              BottomNavigationBarItem(
                icon:SvgPicture.asset(
                  fireExtinguisherIcon,
                  color: Colors.black,
                  width: 30,
                  height: 30,
                ),
                label: 'Water',
              ),
            ],
          ),
            ));
  }
}
