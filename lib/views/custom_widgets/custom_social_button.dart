import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_home/utils/constants/colors.dart';

import '../../utils/constants/strings.dart';

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
