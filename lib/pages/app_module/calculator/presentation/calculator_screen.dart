import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/svg.assets.dart';
import 'package:bmi_task/core/utils/text_styles.dart';
import 'package:bmi_task/pages/app_module/calculator/presentation/controller/calculator_controller.dart';
import 'package:bmi_task/pages/app_module/calculator/presentation/widgets/male_female.dart';
import 'package:bmi_task/widgets/custom_button.dart';
import 'package:bmi_task/widgets/custom_text.dart';
import 'package:bmi_task/widgets/custom_text_form_field.dart';
import 'package:bmi_task/widgets/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalculatorScreen extends GetView<CalculatorController> {
  CalculatorScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCode.backGroundColorGrey,
      appBar: AppBar(
        backgroundColor: ColorCode.backGroundColorGrey,
        title: CustomText(
          'Calculator',
          textStyle: TextStyles.textLarge.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: InkWell(
              onTap: () async{
                final shouldSignOut =
                    await showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title:
                    const Text('Please Confirm'),
                    content: const Text(
                        'Are you sure you want to sign out?'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(ctx)
                              .pop(false);
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                        child: const Text('Sign Out'),
                      ),
                    ],
                  ),
                );

                if (shouldSignOut ?? false) {
                  controller.signOut();
                }
              },
              child: AppSVGAssets.getWidget(
                AppSVGAssets.logout,
                height: 25.h,
                fit: BoxFit.cover,
                width: 40.w,
                color: ColorCode.lightRed,
              ),
            ),
          ),
        ],
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
                        fontWeight: FontWeight.w900,
                        color: ColorCode.primary)),
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
                          if (controller.weightController.text?.isEmpty ?? false) {
                            return 'Enter a valid number';
                          }
                          final number = num.tryParse(controller.weightController.text);
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
                          if (controller.heightController.text?.isEmpty ?? false) {
                            return 'Enter a valid number';
                          }
                          final number = num.tryParse(controller.heightController.text);
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
                MaleAndFemaleWidget(controller: controller,),
                Gaps.vGap24,
              CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                            controller.saveWeightData();
                        }
                      },
                      backGroundColor: ColorCode.primary,
                      child: CustomText('CALCULATE',
                          textStyle: TextStyles.textMedium.copyWith(
                              fontWeight: FontWeight.w900,
                              color: ColorCode.white)),
                    ),
              ],
            )),
      ),
    );
  }
}


