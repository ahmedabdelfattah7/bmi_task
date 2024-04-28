import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/text_styles.dart';
import 'package:bmi_task/widgets/custom_text.dart';
import 'package:bmi_task/widgets/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    Key? key,
    this.color,
    this.icon, this.onTap,this.label,this.labelColor,this.isGuest=false,
  }) : super(key: key);
  final Color? color;
  final Color? labelColor;
  final Widget? icon;
  final VoidCallback? onTap;
  final String? label;
  final bool isGuest;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color ?? ColorCode.primary),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 35),
          child: Center(
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon ?? SizedBox.shrink(),
                Gaps.hGap12,
                CustomText(
                    label ?? "",
                  textStyle: TextStyles.textSmall.copyWith(
                    color: labelColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}