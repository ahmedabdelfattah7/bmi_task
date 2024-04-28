import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/svg.assets.dart';
import 'package:bmi_task/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:get/get.dart';

class MainHomeController extends SuperController<bool> {
  MainHomeController();
  final PersistentTabController navigate =
  PersistentTabController(initialIndex: 0);
  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        contentPadding: 0,
        icon: navigate.index == 0
            ? AppSVGAssets.getWidget(AppSVGAssets.home,
            width: 20, height: 20, fit: BoxFit.contain,
          color: ColorCode.titleblack,
        )
            : AppSVGAssets.getWidget(
          AppSVGAssets.home,
        ),
        activeColorSecondary: ColorCode.black,
        iconSize: 30,
        title: 'Calculator',
        textStyle: TextStyles.textSmall,
        activeColorPrimary: ColorCode.titleGrey.withOpacity(.3),
        inactiveColorPrimary: null,
      ),
      PersistentBottomNavBarItem(
        contentPadding: 0,
        icon: navigate.index == 1
            ? AppSVGAssets.getWidget(AppSVGAssets.mobile,
            width: 20,
            height: 20,
            color: ColorCode.titleblack,
            fit: BoxFit.contain)
            : AppSVGAssets.getWidget(
          AppSVGAssets.mobile,
        ),
        activeColorSecondary: ColorCode.black,
        iconSize: 30,
        title: 'BMI',
        textStyle: TextStyles.textSmall,
        activeColorPrimary: ColorCode.titleGrey.withOpacity(.3),
        inactiveColorPrimary: null,
      ),
    ];
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}