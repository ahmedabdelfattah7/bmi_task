import 'package:cloud_firestore/cloud_firestore.dart';

class WeightModel {
   double? age;
   double? weight;
   double? height;
   String? id;
   DateTime? date;
   String? gender;

  WeightModel({
     this.age,
     this.weight,
     this.height,
     this.date,
    this.id,
    this.gender,
  });

  factory WeightModel.fromJson(Map<String, dynamic> json) {
    return WeightModel(
      id: json['id'],
      age: json['age'],
      gender: json['gender'],
      height: json['height'] as double,
      weight: json['weight'] as double,
      date: (json['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'age':age,
      'height': height,
      'weight': weight,
      'date': date,
      'gender':gender,
    };
  }
}