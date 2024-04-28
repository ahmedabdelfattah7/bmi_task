import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/pages/app_module/Bmi/service/bmi_service.dart';
import 'package:bmi_task/pages/app_module/calculator/model/bmi_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class BmiController extends SuperController<bool>{
  BmiService bmiService;
  BmiController({required this.bmiService});
  RxList<WeightModel> weightModelList = RxList<WeightModel>();
  WeightModel? weightModel;
  int weightCount = 0;
  int currentPage =1;

  ScrollController scrollController = ScrollController();


  Future<void> getWeightData() async {
    change(true, status: RxStatus.loading());
    bool success = await bmiService.getWeightData();
    if (success) {
      weightModelList.assignAll(bmiService.weightModelList);
      debugPrint(bmiService.weightModelList.toString());
      change(true, status: RxStatus.success());
      debugPrint('wight fetched successfully');
    } else {
      change(true, status: RxStatus.success());
      weightModelList.clear();
      debugPrint('Error fetching data');
    }
  }
  Future<void> deleteWeightDoc(String docId) async {
    bool success = await bmiService.deleteWeightDoc(docId);
    if (success) {
      Get.snackbar(
        'Success!'.tr,
        'Data deleted successfully'.tr,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        maxWidth: 300,
        backgroundColor: ColorCode.greendark,
        margin: const EdgeInsets.all(16.0),
        icon: const Icon(Icons.check_circle, color: Colors.white),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
      );
      debugPrint('Document deleted successfully');
    } else {
      Get.snackbar(
        'Error'.tr,
        'Failed to delete document'.tr,
        snackPosition: SnackPosition.BOTTOM,
        maxWidth: 300,
        backgroundColor: ColorCode.greendark,
        margin: const EdgeInsets.all(16.0),
        icon: const Icon(Icons.error, color: Colors.white),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
      );
      debugPrint('Error deleting document');
    }
  }

  double calculateBMI(double height, double weight) {
    final double result = weight / (height * height / 10000);
    return result.roundToDouble();
  }

  String getBMIRange(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight'.tr;
    } else if (bmi < 24.9) {
      return 'Normal'.tr;
    } else if (bmi < 29.9) {
      return 'Overweight'.tr;
    } else if (bmi < 34.9) {
      return 'Obesity Class I'.tr;
    } else if (bmi < 39.9) {
      return 'Obesity Class II'.tr;
    } else {
      return 'Obesity Class III'.tr;
    }
  }
  Future<void> updateWeight({
    required String docId,
  }) async {
    bool success = await bmiService.updateWeightData(
      weight: double.parse(weightController.text),
      date: DateFormat('dd MMM yyyy').parse(dateController.text),
      height: double.parse(heightController.text),
      age: double.parse(ageController.text),
      gender: selectedGender.value,
      docId: docId,
    );

    if (success) {
      getWeightData();
      Get.snackbar(
        'Success!'.tr,
        'Data updated successfully'.tr,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        maxWidth: 300,
        backgroundColor: ColorCode.greendark,
        margin: const EdgeInsets.all(16.0),
        icon: const Icon(Icons.check_circle, color: Colors.white),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
      );
      print('Weight data updated successfully');
    } else {
      print('Failed to update weight data');
    }
  }

@override
  void onInit()async {
   getWeightData();

   change(null, status: RxStatus.success());
    super.onInit();
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
  RxString selectedGender = 'Female'.obs;
  RxBool maleSelected = false.obs;
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
}