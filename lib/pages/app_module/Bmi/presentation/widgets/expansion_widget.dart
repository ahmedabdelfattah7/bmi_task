import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/pages/app_module/Bmi/presentation/controller/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class ExpansionWidget extends GetView<BmiController> {
  ExpansionWidget({
    super.key,

  });


  final GlobalKey _expansionTileKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final String interpretation =
    controller.getBMIRange(controller.calculateBMI(
      controller.weightModelList.first.height!,
      controller.weightModelList.first.weight!,
    ));
    return  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorCode.grey)
      ),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        collapsedIconColor: Colors.black,
        iconColor: ColorCode.titleblack,
        key: _expansionTileKey,
        leading: const FaIcon(
          FontAwesomeIcons.squarePlus,
          color: Colors.blue,
        ),
        title: const Text(
          ' More Statistics ',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        children: [
          ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.scaleBalanced,
                color: Colors.redAccent,
              ),
              title: const Text(
                'Your Weight',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              subtitle: RichText(
                text: TextSpan(
                  text: '${controller.weightModelList.first.weight} ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  children: const [
                    TextSpan(
                      text: 'kg',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )),
          ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.arrowsUpToLine,
                color: Colors.orange,
              ),
              title: const Text(
                'Your Height',
                style: TextStyle(
                  color:Colors.black,
                ),
              ),
              subtitle: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${controller.weightModelList.first.height!} ',
                      style: const TextStyle(
                        color:  Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: 'cm',
                      style: TextStyle(
                        color:  Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )),
          ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.weightScale,
                color: Colors.green,
              ),
              title: const Text(
                'Bmi Weight',
                style: TextStyle(
                  color:  Colors.black,
                ),
              ),
              subtitle: RichText(
                text: TextSpan(
                  text:
                  '${controller.calculateBMI(controller.weightModelList.first.height!, controller.weightModelList.first.weight!)} ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: 'kg',
                      style: TextStyle(
                        color:  Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )),
          ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.heartPulse,
                color: Colors.red,
              ),
              title: Text(
                'Healthiness',
                style: TextStyle(
                  color:Colors.black,
                ),
              ),
              subtitle: Text(
                interpretation,
                style: interpretation == 'Normal'
                    ? const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                )
                    : const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              )),
        ],
        onExpansionChanged: (isExpanded) {
          if (isExpanded) {
            Future.delayed(const Duration(milliseconds: 300), () {
              Scrollable.ensureVisible(
                _expansionTileKey.currentContext!,
                alignment: 0.5,
                duration: const Duration(milliseconds: 300),
              );
            });
          }
        },
      ),
    );
  }
}