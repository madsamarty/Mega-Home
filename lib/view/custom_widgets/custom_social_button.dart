import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants/colors.dart';

class CustomSocialButton extends StatelessWidget {
  final String path;
  final Color backgroundColor;
  final Color textColor;
  final Function onTap;

  const CustomSocialButton(
      {Key? key,
      this.path = "",
      this.backgroundColor = btnBgColor,
      required this.onTap,
      this.textColor = btnTxtColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        height: 30,
        width: 30,
        child: SvgPicture.asset(
          path,
          color: btnBgColor,
        ),
      ),
    );
  }
}
