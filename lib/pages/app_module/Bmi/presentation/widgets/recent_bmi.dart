import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/text_styles.dart';
import 'package:bmi_task/pages/app_module/Bmi/presentation/controller/bmi_controller.dart';
import 'package:bmi_task/pages/app_module/Bmi/presentation/widgets/paginated_firestore_listview.dart';
import 'package:bmi_task/widgets/custom_text.dart';
import 'package:bmi_task/widgets/gaps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentBmi extends GetView<BmiController> {
  RecentBmi({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorCode.backGroundColorGrey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorCode.backGroundColorGrey,
        title: CustomText(
          'Recent',
          textStyle: TextStyles.textMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22.0,
          vertical: 22,
        ),
        child: controller.weightModelList.isNotEmpty
            ? PaginatedListView()
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
              ),
      ),
    );
  }
}


