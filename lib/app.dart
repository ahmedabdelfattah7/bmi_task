import 'package:bmi_task/routes/app_pages.dart';
import 'package:bmi_task/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BmiTracker extends StatelessWidget {
  const BmiTracker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

        builder: (BuildContext context, child) {
          return GetMaterialApp(

            debugShowCheckedModeBanner: false,
            title: 'Bmi',
            getPages: AppPages.routes,
            initialRoute: Routes.SPLASH,
          );
        });
  }
}
