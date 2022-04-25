import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';

class HomeViewModel extends GetxController {

  //
  // Fire Sensor


  //
  // Gas Sensor
  bool _gasStatus = true;
  bool get gasStatus => _gasStatus;
  Color _gasSensorBackgroundColor = color101;
  Color get gasSensorBackgroundColor => _gasSensorBackgroundColor;
  Color _gasSensorFontColor = Colors.black;
  Color get gasSensorFontColor => _gasSensorFontColor;

  //
  // Water Sensor
  bool _waterStatus = true;
  bool get waterStatus => _waterStatus;
  Color _waterSensorBackgroundColor = color101;
  Color get waterSensorBackgroundColor => _waterSensorBackgroundColor;
  Color _waterSensorFontColor = Colors.black;
  Color get waterSensorFontColor => _waterSensorFontColor;

  //
  // Door Switch
  bool _doorStatus = true;
  bool get doorStatus => _doorStatus;
  Color _doorSensorBackgroundColor = color101;
  Color get doorSensorBackgroundColor => _doorSensorBackgroundColor;
  Color _doorSensorFontColor = Colors.black;
  Color get doorSensorFontColor => _doorSensorFontColor;



  changeGasPowerStatus() {
    if (_gasStatus == true) {
      _gasStatus = false;
      _gasSensorBackgroundColor = Colors.black;
      _gasSensorFontColor = Colors.white;
    } else {
      _gasStatus = true;
      _gasSensorBackgroundColor = color101;
      _gasSensorFontColor = Colors.black;
    }
    update();
  }

  changeWaterPowerStatus() {
    if (_waterStatus == true) {
      _waterStatus = false;
      _waterSensorBackgroundColor = Colors.black;
      _waterSensorFontColor = Colors.white;
    } else {
      _waterStatus = true;
      _waterSensorBackgroundColor = color101;
      _waterSensorFontColor = Colors.black;
    }
    update();
  }

  changeDoorPowerStatus() {
    if (_doorStatus == true) {
      _doorStatus = false;
      _doorSensorBackgroundColor = Colors.black;
      _doorSensorFontColor = Colors.white;
    } else {
      _doorStatus = true;
      _doorSensorBackgroundColor = color101;
      _doorSensorFontColor = Colors.black;
    }
    update();
  }
}
