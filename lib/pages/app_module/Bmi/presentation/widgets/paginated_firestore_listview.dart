import 'package:bmi_task/core/utils/colors.dart';
import 'package:bmi_task/core/utils/constats.dart';
import 'package:bmi_task/pages/app_module/Bmi/presentation/controller/bmi_controller.dart';
import 'package:bmi_task/pages/app_module/Bmi/presentation/widgets/recent_widget.dart';
import 'package:bmi_task/widgets/gaps.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_paginate_firestore/bloc/pagination_listeners.dart';
import 'package:flutterflow_paginate_firestore/paginate_firestore.dart';
import 'package:get/get.dart';

class PaginatedListView extends GetView<BmiController> {
  PaginatedListView({
    super.key,

  });
final BmiController bmiController = Get.find();
  final PaginateRefreshedChangeListener refreshChangeListener =
  PaginateRefreshedChangeListener();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: PaginateFirestore(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        bottomLoader:
        const Center(child: CupertinoActivityIndicator()),
        itemBuilder: (context, documentSnapshots, index) {
          var item = controller.weightModelList[index];
          return Dismissible(
            direction: DismissDirection.endToStart,
            background: Container(
              decoration: BoxDecoration(
                  color: ColorCode.primary,
                  borderRadius: BorderRadius.circular(15)),
              width: double.infinity,
              child: const Center(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 180),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            confirmDismiss: (direction) => showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                    title: Text('Please Confirm'),
                    content:
                    Text('Are you sure you want to delete?'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(ctx).pop(false);
                          },
                          child: Text('Cancel')),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {
                            Navigator.of(ctx).pop(true);
                          },
                          child: Text('Confirm')),
                    ])),
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.endToStart) {
                controller.deleteWeightDoc(item.id!);
                controller.weightModelList.remove(item);
              }
            },
            key: Key(item.id![index]),
            child: RecentWidget(
              index: index,
            ),
          );
        },
        itemsPerPage: 4,
        query: FirebaseFirestore.instance
            .collection('users')
            .doc(userUid)
            .collection('weight')
            .orderBy('date', descending: true),
        itemBuilderType: PaginateBuilderType.listView,
        separator: Gaps.vGap12,
        isLive: false,
        listeners: [
          refreshChangeListener,
        ],
      ),
      onRefresh: () async {
        refreshChangeListener.refreshed = true;
      },
    );
  }
}