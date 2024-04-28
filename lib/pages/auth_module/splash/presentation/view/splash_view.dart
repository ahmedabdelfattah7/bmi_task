import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/svg.assets.dart';
import 'package:bmi_task/core/utils/text_styles.dart';
import 'package:bmi_task/pages/auth_module/splash/presentation/controller/splash_controller.dart';
import 'package:bmi_task/widgets/custom_text.dart';
import 'package:bmi_task/widgets/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashView  extends GetView<SplashController> {
  const SplashView ({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        color: ColorCode.deepBlue,

        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Expanded(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: AppSVGAssets.getWidget(AppSVGAssets.logo,
                              fit: BoxFit.fill, height: 70.h, width: 118.w)),
                      Gaps.vGap15,
                      CustomText(
                        "Bmi Tracker",
                        textStyle: TextStyles.textLarge.copyWith(
                            fontWeight: FontWeight.w700,
                            color: ColorCode.white
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}