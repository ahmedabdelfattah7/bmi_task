import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/pages/app_module/Bmi/presentation/controller/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:get/get.dart';

class GaugeWidget extends GetView<BmiController>  {
  const GaugeWidget({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    return  AnimatedRadialGauge(
      duration: const Duration(seconds: 2),
      curve: Curves.elasticIn,
      radius: 200,
      value: controller.calculateBMI(
          controller.weightModelList.first.height!,
          controller.weightModelList.first.weight!),
      axis: const GaugeAxis(
        min: 16,
        max: 42,
        degrees: 180,
        style: GaugeAxisStyle(
          thickness: 100,
          background: Color(0xFFDFE2EC),
          segmentSpacing: 0,
        ),
        pointer: GaugePointer.needle(
          borderRadius: 16,
          width: 30,
          height: 110,
          color: ColorCode.titleblack,
        ),
        progressBar: GaugeProgressBar.rounded(
          color: Colors.transparent,
        ),
        segments: [
          GaugeSegment(
            from: 16.0,
            to: 17,
            color: ColorCode.deepBlue,
            cornerRadius: Radius.zero,
          ),
          GaugeSegment(
            from: 16.0,
            to: 17.0,
            color: Colors.blue,
            cornerRadius: Radius.zero,
          ),
          GaugeSegment(
            from: 17,
            to: 18.5,
            color: ColorCode.lightBlue,
            cornerRadius: Radius.zero,
          ),
          GaugeSegment(
            from: 18.5,
            to: 25,
            color: Colors.greenAccent,
            cornerRadius: Radius.zero,
          ),
          GaugeSegment(
            from: 25,
            to: 30,
            color: Colors.yellow,
            cornerRadius: Radius.zero,
          ),
          GaugeSegment(
            from: 30,
            to: 35,
            color: Colors.orange,
            cornerRadius: Radius.zero,
          ),
          GaugeSegment(
            from: 35,
            to: 40,
            color: Colors.orangeAccent,
            cornerRadius: Radius.zero,
          ),
          GaugeSegment(
            from: 40,
            to: 42,
            color: Colors.red,
            cornerRadius: Radius.zero,
          ),
        ],
      ),
    );
  }
}