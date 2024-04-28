import 'package:bmi_task/pages/app_module/Bmi/presentation/controller/bmi_controller.dart';
import 'package:bmi_task/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/text_styles.dart';
import 'package:bmi_task/pages/app_module/calculator/presentation/widgets/male_female.dart';
import 'package:bmi_task/widgets/custom_button.dart';
import 'package:bmi_task/widgets/custom_text.dart';
import 'package:bmi_task/widgets/custom_text_form_field.dart';
import 'package:bmi_task/widgets/gaps.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditForm extends GetView<BmiController> {
  EditForm({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    return Scaffold(
      backgroundColor: ColorCode.backGroundColorGrey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorCode.backGroundColorGrey,
        title: CustomText(
          'Edit',
          textStyle: TextStyles.textMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText('Enter your Data',
                    textStyle: TextStyles.textMedium.copyWith(
                        fontWeight: FontWeight.w900, color: ColorCode.primary)),
                Gaps.vGap24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        filledColor: Colors.white,
                        hint: '65',
                        onSave: (String) {},
                        inputType: TextInputType.number,
                        label: 'Weight',
                        controller: controller.weightController,
                        validator: (value) {
                          if (controller.weightController.text?.isEmpty ??
                              false) {
                            return 'Enter a valid number';
                          }
                          final number =
                              num.tryParse(controller.weightController.text);
                          if (number == null) {
                            return 'Enter a valid number';
                          }
                          if (number < 40 || number > 220) {
                            return 'between 40 and 220';
                          }
                          return null;
                        },
                      ),
                    ),
                    Gaps.hGap15,
                    Expanded(
                      child: CustomTextFormField(
                        filledColor: Colors.white,
                        hint: '180',
                        onSave: (String) {},
                        inputType: TextInputType.number,
                        label: 'Height',
                        controller: controller.heightController,
                        validator: (value) {
                          if (controller.heightController.text?.isEmpty ??
                              false) {
                            return 'Enter a valid number';
                          }
                          final number =
                              num.tryParse(controller.heightController.text);
                          if (number == null) {
                            return 'Enter a valid number';
                          }
                          if (number < 100 || number > 250) {
                            return 'between 40 and 220';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Gaps.vGap24,
                CustomTextFormField(
                  filledColor: Colors.white,
                  hint: '',
                  onSave: (String) {},
                  inputType: TextInputType.datetime,
                  label: 'Date',
                  controller: controller.dateController,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse('2026-05-03'),
                    ).then((value) => {
                          controller.dateController.text =
                              DateFormat('dd MMM yyyy').format(value!),
                        });
                  },
                  validator: (value) {
                    if (controller.heightController.text?.isEmpty ?? false) {
                      return 'please enter the date';
                    }
                    return null;
                  },
                ),
                Gaps.vGap24,
                CustomTextFormField(
                  filledColor: Colors.white,
                  hint: '',
                  onSave: (String) {},
                  inputType: TextInputType.number,
                  label: 'Age',
                  controller: controller.ageController,
                  onTap: () {},
                  validator: (value) {
                    if (controller.heightController.text?.isEmpty ?? false) {
                      return 'please enter the age';
                    }
                    return null;
                  },
                ),
                Gaps.vGap24,
                MaleAndFemaleWidget(
                  controller: controller,
                ),
                Gaps.vGap24,
                CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      controller.updateWeight(docId: data.id ?? "");
                      Get.toNamed(Routes.BMI);
                    }
                  },
                  backGroundColor: ColorCode.primary,
                  child: CustomText('CALCULATE',
                      textStyle: TextStyles.textMedium.copyWith(
                          fontWeight: FontWeight.w900, color: ColorCode.white)),
                ),
              ],
            )),
      ),
    );
  }
}
