import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/text_styles.dart';
import 'package:bmi_task/pages/app_module/Bmi/presentation/controller/bmi_controller.dart';
import 'package:bmi_task/pages/app_module/Bmi/presentation/widgets/expansion_widget.dart';
import 'package:bmi_task/pages/app_module/Bmi/presentation/widgets/gauge_widget.dart';
import 'package:bmi_task/routes/app_routes.dart';
import 'package:bmi_task/widgets/custom_text.dart';
import 'package:bmi_task/widgets/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiScreen extends GetView<BmiController> {
  BmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? interpretation = controller.weightModelList.isNotEmpty
        ? controller.getBMIRange(controller.calculateBMI(
      controller.weightModelList.first.height!,
      controller.weightModelList.first.weight!,
    ))
        : null;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          'BMI',
          textStyle: TextStyles.textLarge.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.RECENT);
              },
              child: CustomText(
                'Recent',
                textStyle: TextStyles.textMedium.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColorCode.highlightblue,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        return controller.weightModelList.isNotEmpty
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 70.0),
                  child: Center(
                    child: Column(
                      children: [
                        GaugeWidget(),
                        Gaps.vGap24,
                        CustomText(
                          'Your Bmi is ...',
                          textStyle: TextStyles.textMedium.copyWith(
                            fontWeight: FontWeight.w900,
                            color: ColorCode.titleblack,
                          ),
                        ),
                        Gaps.vGap12,
                        CustomText(
                          '${controller.calculateBMI(controller.weightModelList.first.height!, controller.weightModelList.first.weight!) ?? ""}',
                          textStyle: TextStyles.textXLarge.copyWith(
                            fontWeight: FontWeight.w900,
                            color: ColorCode.titleblack,
                          ),
                        ),
                        Gaps.vGap12,
                        CustomText(
                          '${controller.weightModelList.first.weight ?? ""} kg | ${controller.weightModelList.first.height ?? ""} cm | ${controller.weightModelList.first.gender ?? ""} | ${controller.weightModelList.first.age?.floor() ?? ""} years old',
                          textStyle: TextStyles.textSmall.copyWith(
                            fontWeight: FontWeight.w400,
                            color: ColorCode.titleGrey,
                          ),
                        ),
                        Gaps.vGap12,
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: interpretation  == 'Normal'
                                ? Colors.green
                                : Colors.orangeAccent,
                          ),
                          child: Text(
                            controller.weightModelList.isNotEmpty
                                ? controller.getBMIRange(controller.calculateBMI(
                              controller.weightModelList.first.height!,
                              controller.weightModelList.first.weight!,
                            ))
                                : '',
                            style: const TextStyle(
                              color: ColorCode.titleblack,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Gaps.vGap12,
                        ExpansionWidget(),
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    Gaps.vGap15,
                    Text(
                      'Bad connection Or No data...',
                      style: TextStyles.textLarge.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
