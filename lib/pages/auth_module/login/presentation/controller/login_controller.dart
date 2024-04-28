import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/pages/auth_module/login/service/login_service.dart';
import 'package:bmi_task/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends SuperController<bool>{
  final LoginService loginService;

  LoginController({ required
    this.loginService,
  });

  Future<void> signInWithGoogle() async {
    loginService.signInWithGoogle().then((userCredential) {
      if (userCredential.user?.uid != null) {
        Get.snackbar(
          'Success!',
          'Login is successful!',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          maxWidth: 300,
          backgroundColor: ColorCode.greendark,
        );

          Get.offAllNamed(Routes.HOME);
        change(true, status: RxStatus.success());
      }
    }).catchError((error) {
      change(false, status: RxStatus.success());
      debugPrint('login failed: ${error.toString()}');
      Get.snackbar(
        'Error!',
        'login failed: ${error.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        maxWidth: 300,
        backgroundColor: ColorCode.red,
      );
    });
  }


  Future<void> signInAnonymously() async {
    await loginService.signInAnonymously().then((userCredential) {
      if (userCredential != null) {
        Get.snackbar(
          'Success!',
          'Login is successful!',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          maxWidth: 300,
          backgroundColor:  ColorCode.greendark,
        );

        Get.offAllNamed(Routes.HOME);
        change(true, status: RxStatus.success());
      }
    }).catchError((error) {
      change(false, status: RxStatus.success());
      debugPrint('login failed: ${error.toString()}');
      Get.snackbar(
        'Error!',
        'login failed: ${error.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        maxWidth: 300,
        backgroundColor: ColorCode.lightRed,
      );
    });
  }



  @override
  Future<void> onInit() async {
    super.onInit();
    change(null, status: RxStatus.success());
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