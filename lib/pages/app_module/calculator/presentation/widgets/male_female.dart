import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/svg.assets.dart';
import 'package:bmi_task/core/utils/text_styles.dart';
import 'package:bmi_task/pages/app_module/calculator/presentation/controller/calculator_controller.dart';
import 'package:bmi_task/widgets/custom_text.dart';
import 'package:bmi_task/widgets/custom_text_form_field.dart';
import 'package:bmi_task/widgets/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class MaleAndFemaleWidget extends StatelessWidget {
   MaleAndFemaleWidget({
    super.key,
    required this.controller,
  });

  var controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
              () => InkWell(
            onTap: () {
              controller.setGender(true);
            },
            child: Container(
              width: Get.width / 2.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: ColorCode.borderGrey),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: controller.maleSelected.value
                        ? ColorCode.shadowColorGrey
                        : Colors.transparent,
                    spreadRadius: 0,
                    blurRadius: 26,
                    offset: const Offset(0, 16),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 25),
                      child: Center(
                        child: Column(
                          children: [
                            const Icon(
                              FontAwesomeIcons.mars,
                              size: 50,
                              color: ColorCode.titleblack,
                            ),
                            CustomText(
                              'Male',
                              textStyle: TextStyles.textXSmall,
                            )
                          ],
                        ),
                      ),
                    ),
                    controller.maleSelected.value
                        ? Positioned(
                      top: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: AppSVGAssets.getWidget(
                          AppSVGAssets.pinkRight,
                          color: ColorCode.lightBlue,
                          height: 24.h,
                          width: 24.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Gaps.hGap15,
        Obx(
              () => InkWell(
            onTap: () {
              controller.setGender(false);
            },
            child: Container(
              width: Get.width / 2.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: ColorCode.borderGrey),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: !controller.maleSelected.value
                        ? ColorCode.shadowColorGrey
                        : Colors.transparent,
                    spreadRadius: 0,
                    blurRadius: 26,
                    offset: const Offset(0, 16),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 25),
                      child: Center(
                        child: Column(
                          children: [
                            const Icon(
                              FontAwesomeIcons.venus, // Female icon
                              size: 50,
                              color: ColorCode.titleblack,
                            ),
                            CustomText(
                              'Female',
                              textStyle: TextStyles.textXSmall,
                            )
                          ],
                        ),
                      ),
                    ),
                    !controller.maleSelected.value
                        ? Positioned(
                      top: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: AppSVGAssets.getWidget(
                          AppSVGAssets.pinkRight,
                          color: ColorCode.lightBlue,
                          height: 24.h,
                          width: 24.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                        : SizedBox.shrink()
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}