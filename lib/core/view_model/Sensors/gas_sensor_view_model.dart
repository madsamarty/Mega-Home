import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_home_graduation_project/utils/constants/colors.dart';

class GasSensorViewModel extends GetxController{
  bool _sensorStatus = true;
  bool get sensorStatus => _sensorStatus;
  Color _cardBackgroundColor = Colors.white;
  Color get cardBackgroundColor => _cardBackgroundColor;
  Color _cardFontColor = Colors.black;
  Color get cardFontColor => _cardFontColor;
  Color _statusLedColor = colorOnline;
  Color get statusLedColor => _statusLedColor;
  Color _toggleTextColor = Colors.black;
  Color get toggleTextColor => _toggleTextColor;
  Color _toggleColor = Colors.white;
  Color get toggleColor => _toggleTextColor;
  String _statusPhrase = "Online";
  String get statusPhrase => _statusPhrase;


  changeGasPowerStatus() {
    if (_sensorStatus == true) {
      _sensorStatus = false;
      _cardBackgroundColor = Colors.white;
      _cardFontColor = Colors.black;
      _statusLedColor = Colors.red;
      _statusPhrase = "Offline";
      _toggleTextColor = Colors.white;
      _toggleColor = Colors.black;
    } else {
      _sensorStatus = true;
      _cardBackgroundColor = Colors.white;
      _cardFontColor = Colors.black;
      _statusLedColor = colorOnline;
      _statusPhrase = "Online";
      _toggleTextColor = Colors.black;
      _toggleColor = Colors.white;
    }
    update();
  }
}