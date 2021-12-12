import 'package:flutter/material.dart';
import 'package:mega_home/utils/constance.dart';

class CustomStatusCard extends StatelessWidget {
  const CustomStatusCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradientStatusColors),
      ),
    );
  }
}
