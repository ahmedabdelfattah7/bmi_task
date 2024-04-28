import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/svg.assets.dart';
import 'package:bmi_task/core/utils/text_styles.dart';
import 'package:bmi_task/pages/auth_module/login/presentation/controller/login_controller.dart';
import 'package:bmi_task/pages/auth_module/login/presentation/view/widgets/social_login_btn.dart';
import 'package:bmi_task/widgets/custom_text.dart';
import 'package:bmi_task/widgets/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorCode.backGroundColorGrey,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 35),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gaps.vGap40,
                  Center(
                      child: AppSVGAssets.getWidget(AppSVGAssets.logo,
                          fit: BoxFit.fill, height: 70.h, width: 118.w)),
                  Gaps.vGap15,
                  CustomText(
                    'Welcome',
                    textStyle: TextStyles.textXLarge,
                  ),
                  Gaps.vGap15,
                  CustomText(
                    'Use our Easy way to Sign in',
                    textStyle: TextStyles.textSmall.copyWith(
                      color: ColorCode.titleGrey,
                    ),
                  ),
                  Gaps.vGap48,
                  SocialLoginButton(
                    label: 'Sign in with Google !',
                    labelColor: ColorCode.titleblack,
                    color: ColorCode.white,
                    onTap: () {
                      controller.signInWithGoogle();
                    },
                    icon: AppSVGAssets.getWidget(AppSVGAssets.google,)
                  ),
                  Gaps.vGap24,
                  SocialLoginButton(
                    label: 'Sign as a Guest !',
                    labelColor: ColorCode.white,
                    color: ColorCode.lightRed,
                    onTap: () {
                      controller.signInAnonymously();
                    },
                    icon:  AppSVGAssets.getWidget(AppSVGAssets.profile2user,color: ColorCode.white, )
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
