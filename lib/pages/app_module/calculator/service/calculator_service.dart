import 'package:bmi_task/core/utils/constats.dart';
import 'package:bmi_task/pages/app_module/calculator/model/bmi_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bmi_task/core/local_network/cache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CalculatorService extends GetxService {
  RxList<WeightModel> weightModelList = RxList<WeightModel>();

  Future<bool> saveWeightData({
    required double wight,
    required DateTime date,
    required double height,
    required double age,
    required String gender,
  }) async {
    try {
      WeightModel weightModel =
          WeightModel(weight: wight, date: date, height: height, age: age,gender: gender);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .collection('weight')
          .add(weightModel.toJson());

      return true;
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }

  Future<void> signOut() async {
    await CacheHelper.removeData();
    debugPrint('user id is deleted');
    await FirebaseAuth.instance.signOut();

  }
}
