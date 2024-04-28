import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/text_styles.dart';
import 'package:bmi_task/pages/app_module/Bmi/presentation/controller/bmi_controller.dart';
import 'package:bmi_task/routes/app_routes.dart';
import 'package:bmi_task/widgets/custom_text.dart';
import 'package:bmi_task/widgets/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RecentWidget extends  GetView<BmiController> {
   RecentWidget({
    super.key,
required this.index
  });
  int index;
  @override
  Widget build(BuildContext context) {
 var data =   controller.weightModelList[index];
 String? interpretation = controller.weightModelList.isNotEmpty
     ? controller.getBMIRange(controller.calculateBMI(
   data.height ?? 0.0,
   data.weight ?? 0.0,
 ))
     : null;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  'BMI : ${controller.calculateBMI(data.height!, data.weight!)}',
                  textStyle: TextStyles.textMedium.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorCode.titleblack,
                  ),
                ),
                CustomText(
                  '${data.gender}',
                  textStyle: TextStyles.textMedium.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorCode.highlightblue,
                  ),
                ),
              ],
            ),
            Gaps.vGap12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  'weight : ${data.weight}',
                  textStyle: TextStyles.textMedium.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorCode.titleblack,
                  ),
                ),
                CustomText(
                  'height : ${data.height}',
                  textStyle: TextStyles.textMedium.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorCode.titleblack,
                  ),
                ),
              ],
            ),
            Gaps.vGap12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:interpretation == 'Normal'?Colors.green: Colors.orangeAccent,
                      ),
                    ),
                    Gaps.hGap5,
                    Text(
                      interpretation ?? "",
                      style:  const TextStyle(
                        color:ColorCode.titleblack,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),

                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: ColorCode.highlightblue),
                  onPressed: () {
                Get.toNamed(Routes.Edit,arguments: data);
                  },
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}