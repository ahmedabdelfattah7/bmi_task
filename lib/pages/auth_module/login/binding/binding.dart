import 'package:bmi_task/pages/auth_module/login/presentation/controller/login_controller.dart';
import 'package:bmi_task/pages/auth_module/login/service/login_service.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginService>(LoginService());
    Get.put(LoginController(loginService: Get.find()));
  }
}
