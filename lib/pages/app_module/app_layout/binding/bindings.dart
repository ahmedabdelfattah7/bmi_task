
import 'package:bmi_task/pages/app_module/Bmi/presentation/controller/bmi_controller.dart';
import 'package:bmi_task/pages/app_module/Bmi/service/bmi_service.dart';
import 'package:bmi_task/pages/app_module/app_layout/presentation/controller/main_home_controller.dart';
import 'package:bmi_task/pages/app_module/calculator/presentation/controller/calculator_controller.dart';
import 'package:bmi_task/pages/app_module/calculator/service/calculator_service.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(MainHomeController());
    Get.put(BmiService());
    Get.put(BmiController(bmiService: Get.find()));
    Get.put(CalculatorService());
    Get.put(CalculatorController(calculatorService: Get.find()));
  }
}
