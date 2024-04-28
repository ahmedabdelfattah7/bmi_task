import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/pages/app_module/Bmi/presentation/bmi_screen.dart';
import 'package:bmi_task/pages/app_module/app_layout/presentation/controller/main_home_controller.dart';
import 'package:bmi_task/pages/app_module/calculator/presentation/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainHome extends GetView<MainHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: GetBuilder<MainHomeController>(builder: (cont) {
        return PersistentTabView(
          context,
          controller: controller.navigate,
          screens: _buildScreens(),
          items: controller.navBarsItems(),
          confineInSafeArea: true,
          navBarHeight: 65.h,

          onItemSelected: (index) {
            cont.update();
          },
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset:
          true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows:
          true,
          decoration: NavBarDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r)),
              colorBehindNavBar: Colors.white,
              boxShadow: [
                const BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 5,
                    spreadRadius: 5,
                    color: ColorCode.shadowColorGrey)
              ]),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,

          itemAnimationProperties: const ItemAnimationProperties(

            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style5, // Choose the nav bar style with this property.
        );
      }),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    CalculatorScreen(),
    BmiScreen(),
  ];
}