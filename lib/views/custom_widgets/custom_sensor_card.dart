import 'package:flutter/material.dart';
import 'package:mega_home/utils/constants/colors.dart';
import 'package:mega_home/utils/constants/strings.dart';
import 'package:mega_home/views/custom_widgets/custom_text.dart';

class CustomSensorCard extends StatelessWidget {
  const CustomSensorCard({Key? key}) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.door_back_door),
              CustomText(
                title: "Door",
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(
                Icons.circle_rounded,
                color: Colors.green,
                size: 15,
              ),
              CustomText(
                title: "Door",
              )
            ],
          ),
          Switch(
            value: true,
            onChanged: (value) {},
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
