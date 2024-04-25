import 'package:bmi_task/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages{
  static const INITIAL = Routes.SPLASH;

  static final routes = [
  GetPage(
  name: Routes.SPLASH,
  page: () => const SplashView(),
  binding: SplashBinding()),
  // GetPage(
  // name: Routes.LOGIN,
  // page: () => LoginView(),
  // binding: LoginBinding(),
  // ),
  ];
}