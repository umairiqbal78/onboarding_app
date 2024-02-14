part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splash = _Paths.splashScreen;
  static const signUpScreen = _Paths.signUpScreen;
  static const loginScreen = _Paths.loginScreen;

}

abstract class _Paths {
  static const splashScreen = '/splash';
  static const signUpScreen = '/signUpScreen';
  static const loginScreen = '/loginScreen';
}
