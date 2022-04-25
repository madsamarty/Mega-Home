import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mega_home_graduation_project/core/view_model/Sensors/door_switch_view_model.dart';
import 'package:mega_home_graduation_project/core/view_model/Sensors/fire_sensor_view_model.dart';
import 'package:mega_home_graduation_project/core/view_model/Sensors/gas_sensor_view_model.dart';
import 'package:mega_home_graduation_project/core/view_model/Sensors/water_Sensor_view_model.dart';

import '../../../core/view_model/home_view_model.dart';

import '../../custom_widgets/custom_sensor_card.dart';
import '../nav_drawer.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  bool isSwitchDoor = false;
  bool smoke = false;
  bool fire = false;
  bool water = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: NavDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const Text(
              'MEGA',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(
                height: 470,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          GetBuilder<DoorSwitchViewModel>(
                            init:Get.find<DoorSwitchViewModel>(),
                            builder:(controller) => CustomSensorCard(
                              sensorName: "Door",
                              sensorIcon: controller.iconName,
                              iconColor: Colors.white,
                              backgroundColor:
                              Colors.black,
                              fontColor: Colors.white,
                              sensorStatus: controller.sensorStatus,
                              statusLedColor: controller.statusLedColor,
                              sensorStatusPhrase: controller.statusPhrase,
                              iconClick: (){
                                controller.changeDoorIcon();
                              },
                              onToggle: () {
                                controller.changeDoorPowerStatus();
                              },
                            ),
                          ),
                          GetBuilder<GasSensorViewModel>(
                            init:Get.find<GasSensorViewModel>(),
                            builder:(controller) => CustomSensorCard(
                              iconColor: Colors.black,
                              sensorName: "Gas",
                              sensorIcon: "assets/icons/gas.svg",
                              backgroundColor:
                              controller.cardBackgroundColor,
                              fontColor: controller.cardFontColor,
                              sensorStatus: controller.sensorStatus,
                              statusLedColor: controller.statusLedColor,
                              sensorStatusPhrase: controller.statusPhrase,
                              iconClick: (){},
                              onToggle: () {
                                controller.changeGasPowerStatus();
                              },
                            ),
                          ),


                        ],
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          GetBuilder<FireSensorViewModel>(
                            init:Get.find<FireSensorViewModel>(),
                            builder:(controller) => CustomSensorCard(
                              iconColor: Colors.black,
                              sensorName: "Fire",
                              sensorIcon: "assets/icons/fire.svg",
                              backgroundColor:
                              controller.cardBackgroundColor,
                              fontColor: controller.cardFontColor,
                              sensorStatus: controller.sensorStatus,
                              statusLedColor: controller.statusLedColor,
                              sensorStatusPhrase: controller.statusPhrase,
                              iconClick: (){},
                              onToggle: () {
                                controller.changeFirePowerStatus();
                              },
                            ),
                          ),

                          GetBuilder<WaterSensorViewModel>(
                            init:Get.find<WaterSensorViewModel>(),
                            builder:(controller) => CustomSensorCard(
                              iconColor: Colors.black,
                              sensorName: "Water",
                              sensorIcon: "assets/icons/water.svg",
                              backgroundColor:
                              controller.cardBackgroundColor,
                              fontColor: controller.cardFontColor,
                              sensorStatus: controller.sensorStatus,
                              statusLedColor: controller.statusLedColor,
                              sensorStatusPhrase: controller.statusPhrase,
                              iconClick: (){},
                              onToggle: () {
                                controller.changeWaterPowerStatus();
                              },
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            if (isSwitchDoor == false)
              const Text(
                'Everything is Okay',
                style: TextStyle(fontSize: 24),
              ),
            if (isSwitchDoor == true)
              Column(
                children: const [
                  Text(
                    'HEY ALEX',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'WELLCOME HOME',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
