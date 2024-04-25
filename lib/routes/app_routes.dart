

abstract class Routes {
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const SIGNUP = '/sign_up';
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
}