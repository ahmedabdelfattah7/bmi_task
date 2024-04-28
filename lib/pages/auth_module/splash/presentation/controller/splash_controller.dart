import 'package:bmi_task/core/local_network/cache_helper.dart';
import 'package:bmi_task/core/utils/constats.dart';
import 'package:bmi_task/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends SuperController<bool> {
  Future<void> init() async {
    try {
      await CacheHelper.init();
      await Future.delayed(
        const Duration(seconds: 2),
      );

      if (userUid != null) {
        Get.offNamed(
          Routes.HOME,
        );
      } else {
        Get.offNamed(
          Routes.LOGIN,
        );
      }
    } catch (ex) {
      debugPrint('error $ex');
      Get.offNamed(
        Routes.LOGIN,
      );
    }
  }

  @override
  void onReady() {
    CacheHelper.init();
    init();
    super.onReady();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
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
}
