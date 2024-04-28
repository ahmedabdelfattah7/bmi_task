

abstract class Routes {
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const CALCULATOR = '/calculator';
  static const BMI = '/BMI';
  static const RECENT = '/recent';
  static const Edit = '/edit';
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
}