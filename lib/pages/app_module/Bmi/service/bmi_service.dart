import 'package:bmi_task/core/utils/constats.dart';
import 'package:bmi_task/pages/app_module/calculator/model/bmi_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiService extends GetxService {
  RxList<WeightModel> weightModelList = RxList<WeightModel>();

  Future<bool> getWeightData() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .collection('weight')
          .orderBy('date', descending: true)
          .get();

      final data = snapshot.docs
          .map((doc) => WeightModel.fromJson({
                ...doc.data(),
                'id': doc.id,
              }))
          .toList();

      weightModelList.assignAll(data);
      return true;
    } catch (error) {
      debugPrint('Error fetching data: $error');
      weightModelList.clear();
      return false;
    }
  }

  Future<bool> deleteWeightDoc(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .collection('weight')
          .doc(docId)
          .delete();
      debugPrint('Document deleted successfully');
      return true;
    } catch (e) {
      debugPrint('Error deleting document: $e');
      return false;
    }
  }

  Future<bool> updateWeightData( {
    required double weight,
      required DateTime date,
      required double height,
      required double age,
      required String gender,
      required String docId,
  }
      ) async {
    try {
      WeightModel updateWeightModel =
      WeightModel(weight: weight, date: date, height: height, age: age,gender: gender);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .collection('weight')
          .doc(docId)
          .update(updateWeightModel.toJson());

      return true;
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }



}
