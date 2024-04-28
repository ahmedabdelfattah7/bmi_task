import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/pages/app_module/Bmi/presentation/controller/bmi_controller.dart';
import 'package:bmi_task/pages/app_module/calculator/model/bmi_model.dart';
import 'package:bmi_task/pages/app_module/calculator/service/calculator_service.dart';
import 'package:bmi_task/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalculatorController extends SuperController<bool> {
  CalculatorService calculatorService;
  CalculatorController({required this.calculatorService});
  BmiController bmiController = Get.find();
  RxBool maleSelected = false.obs;
  RxString selectedGender = 'Female'.obs;

  void setGender(bool isMale) {
    maleSelected.value = isMale;
    if (isMale) {
      selectedGender.value = 'Male';
    } else {
      selectedGender.value = 'Female';
    }
  }

  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  RxList<WeightModel> weightModelList = RxList<WeightModel>();

  Future<void> saveWeightData() async {
    bool success = await calculatorService.saveWeightData(
        wight: double.parse(weightController.text),
        date: DateFormat('dd MMM yyyy').parse(dateController.text),
        height: double.parse(heightController.text),
        age: double.parse(ageController.text),
        gender: selectedGender.value);
    if (success) {
      weightController.clear();
      heightController.clear();
      dateController.clear();
      ageController.clear();
      Get.snackbar(
        'Success!',
        'Data saved successfully',
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        maxWidth: 300,
        backgroundColor: ColorCode.greendark,
        margin: const EdgeInsets.all(16.0),
        icon: const Icon(Icons.check_circle, color: Colors.white),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
      );
      bmiController.getWeightData();
      Get.toNamed(Routes.BMI);
      debugPrint('Data saved successfully');
    } else {
      Get.snackbar(
        'Error!',
        'Failed to save data',
        snackPosition: SnackPosition.BOTTOM,
        maxWidth: 300,
        backgroundColor: ColorCode.lightRed,
        margin: const EdgeInsets.all(16.0),
        icon: const Icon(Icons.error, color: Colors.white),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
      );
      debugPrint('Error saving data');
    }
  }

  Future<void> signOut() async {
    await calculatorService.signOut();
    Get.offNamed(Routes.LOGIN);
    update();
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
