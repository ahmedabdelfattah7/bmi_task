import 'package:bmi_task/pages/app_module/Bmi/presentation/controller/bmi_controller.dart';
import 'package:bmi_task/pages/app_module/Bmi/service/bmi_service.dart';
import 'package:get/get.dart';

class BmiBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BmiService());
    Get.put(BmiController(bmiService: Get.find()));
  }
}
