
import 'package:bmi_task/core/utils/colors.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color backGroundColor;
  final double elevation;
  final double borderRadius;
  final double width;
  final double height;

  const CustomButton(
      {Key? key,
        required this.child,required this.onPressed,
      this.backGroundColor = ColorCode.white,
      this.elevation = 1,
      this.height = 45,
       this.width = double.infinity,
      this.borderRadius = 30.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          side: const BorderSide(color: ColorCode.primary, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: backGroundColor,
          elevation: elevation,
        ),
        // child: CustomText(text, textStyle: TextStyles.textSmall),
        child: child,
      ),
    );
  }
}
