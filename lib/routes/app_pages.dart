import 'package:bmi_task/pages/app_module/Bmi/binding/binding.dart';
import 'package:bmi_task/pages/app_module/Bmi/presentation/bmi_screen.dart';
import 'package:bmi_task/pages/app_module/Bmi/presentation/widgets/edit_widget.dart';
import 'package:bmi_task/pages/app_module/Bmi/presentation/widgets/recent_bmi.dart';
import 'package:bmi_task/pages/app_module/app_layout/binding/bindings.dart';
import 'package:bmi_task/pages/app_module/app_layout/presentation/view/home_layout.dart';
import 'package:bmi_task/pages/app_module/calculator/binding/binding.dart';
import 'package:bmi_task/pages/app_module/calculator/presentation/calculator_screen.dart';
import 'package:bmi_task/pages/auth_module/login/binding/binding.dart';
import 'package:bmi_task/pages/auth_module/login/presentation/view/login_screen.dart';
import 'package:bmi_task/pages/auth_module/splash/binding/binding.dart';
import 'package:bmi_task/pages/auth_module/splash/presentation/view/splash_view.dart';
import 'package:bmi_task/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: Routes.SPLASH,
        page: () => SplashView(),
        binding: SplashBinding()),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => MainHome(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.BMI,
      page: () => BmiScreen(),
      binding: BmiBinding(),
    ),
    GetPage(
      name: Routes.CALCULATOR,
      page: () => CalculatorScreen(),
      binding: CalculatorBinding(),
    ),
    GetPage(
      name: Routes.RECENT,
      page: () => RecentBmi(),
      binding: BmiBinding(),
    ),
    GetPage(
      name: Routes.Edit,
      page: () => EditForm(),
      binding: BmiBinding(),
    ),
  ];
}
