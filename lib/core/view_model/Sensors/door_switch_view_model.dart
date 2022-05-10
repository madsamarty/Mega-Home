import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_home_graduation_project/utils/constants/colors.dart';

class DoorSwitchViewModel extends GetxController{
  bool _sensorStatus = true;
  bool get sensorStatus => _sensorStatus;
  Color _cardBackgroundColor = Colors.black;
  Color get cardBackgroundColor => _cardBackgroundColor;
  Color _cardFontColor = Colors.black;
  Color get cardFontColor => _cardFontColor;
  Color _statusLedColor = colorOnline;
  Color get statusLedColor => _statusLedColor;
  String _statusPhrase = "Online";
  String get statusPhrase => _statusPhrase;
  String _iconName = "assets/icons/door.svg";
  String get iconName => _iconName;



  changeDoorPowerStatus() {
    if (_sensorStatus == true) {
      _sensorStatus = false;
      _cardFontColor = Colors.white;
      _statusLedColor = Colors.red;
      _statusPhrase = "Offline";
    } else {
      _sensorStatus = true;

      _cardFontColor = Colors.black;
      _statusLedColor = colorOnline;
      _statusPhrase = "Online";
    }
    update();
  }
  changeDoorIcon(){
    if(_iconName == "assets/icons/door.svg"){
      _iconName = "assets/icons/door-open.svg";
    }else{
      _iconName = "assets/icons/door.svg";
    }
    update();
  }
}