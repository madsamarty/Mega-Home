import 'package:flutter/material.dart';

import 'package:mega_home/utils/constants/colors.dart';
import 'package:mega_home/utils/constants/strings.dart';
import 'package:mega_home/views/custom_widgets/custom_text.dart';

class CustomSensorCard extends StatelessWidget {
  late String sensorName;
  late bool sensorStatus;
  String _sensorStatusPhrase = "Closed";
  CustomSensorCard({
    Key? key,
    required this.sensorName,
    this.sensorStatus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 100,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradientStatusColors),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.door_back_door),
              CustomText(
                title: sensorName,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.circle_rounded,
                color: Colors.green,
                size: 15,
              ),
              CustomText(
                title: _sensorStatusPhrase,
              ),
            ],
          ),
          Switch(
            value: false,
            onChanged: (value) {},
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }

  changeSensorStatus() {
    if (sensorStatus) {
      _sensorStatusPhrase = "Opened";
    } else {
      _sensorStatusPhrase = "Closed";
    }
  }
}
