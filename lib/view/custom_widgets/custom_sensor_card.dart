import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomSensorCard extends StatelessWidget {
  late String sensorName;
  String sensorIcon;
  late bool sensorStatus;
  late Color backgroundColor;
  final Color fontColor;
  final Color iconColor;
  final Color statusLedColor;
  String sensorStatusPhrase;
  final bool defaultStatus = true;
  final Function onToggle;
  final Function iconClick;
  String _sensorStatusPhrase = "Closed";

  CustomSensorCard({
    Key? key,
    required this.sensorName,
    required this.sensorIcon,
    this.sensorStatus = true,
    required this.onToggle,
    this.backgroundColor = Colors.white,
    this.fontColor = Colors.black,
    required this.iconColor,
    required this.statusLedColor,
    required this.sensorStatusPhrase,
    required this.iconClick
  }) : super(key: key);

  //bool isSwitchDoor = true;

  // bool smoke = false;
  // bool fire = false;
  // bool water = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 200,
      width: screenWidth / 2.5,
      child: GestureDetector(
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.black,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  // Icon(Icons.door_back_door,
                  //     color: fontColor, size: 30),
                  SvgPicture.asset(
                    sensorIcon,
                    color: iconColor,
                    width: 24,
                    height: 24,
                  ),
                  Text(
                    sensorName,
                    style: TextStyle(color: fontColor, fontSize: 22),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: statusLedColor,
                    radius: 6,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    sensorStatusPhrase,
                    style: TextStyle(color: fontColor, fontSize: 16),
                  ),
                ],
              ),
              Container(
                child: FlutterSwitch(
                    activeColor: Colors.white,
                    inactiveColor: Colors.black,
                    activeTextColor: Colors.black,
                    inactiveTextColor: Colors.white,
                    activeToggleColor: Colors.black,
                    inactiveToggleColor: Colors.white,
                    toggleColor: Colors.black,
                    activeSwitchBorder: Border.all(color: Color(0xFF121212)),
                    inactiveSwitchBorder: Border.all(color: Color(0xFFffffff)),
                    width: 80,
                    height: 38,
                    valueFontSize: 18.0,
                    toggleSize: 30.0,
                    value: sensorStatus,
                    borderRadius: 22.0,
                    padding: 9.0,
                    showOnOff: true,
                    onToggle: (vale) {
                      onToggle();
                    }),
              ),
            ],
          ),
        ),
        onTap: (){
          iconClick();
        },
      ),
    );
  }
}
