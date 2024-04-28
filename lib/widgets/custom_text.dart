
import 'package:bmi_task/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextStyle textStyle;
  final TextAlign? textAlign;

  const CustomText(this.text,
      {Key? key,
      this.textStyle = TextStyles.textMedium,
      this.maxLines = 2,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      softWrap: false,
    );
  }
}
