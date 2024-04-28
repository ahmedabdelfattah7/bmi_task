
import 'package:bmi_task/pages/app_module/calculator/presentation/controller/calculator_controller.dart';
import 'package:bmi_task/pages/app_module/calculator/service/calculator_service.dart';
import 'package:get/get.dart';

class CalculatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CalculatorService());
    Get.put(CalculatorController(calculatorService: Get.find()));
  }
}
