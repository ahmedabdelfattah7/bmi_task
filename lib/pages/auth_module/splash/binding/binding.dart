import 'package:bmi_task/pages/auth_module/splash/presentation/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
  Get.put(SplashController());
  }
}