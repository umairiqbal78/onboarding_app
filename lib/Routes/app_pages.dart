import 'package:get/get.dart';
import 'package:onboarding/Bindings/auth_binding.dart';
import 'package:onboarding/Features/Authentication/Screens/login_screen.dart';
import 'package:onboarding/Features/OnBoardingAndSplash/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.splash;
  static final routes = <GetPage>[
    /// initials
    GetPage(
      name: _Paths.splashScreen,
      page: () => const SplashScreen(),
    ),
    ///authentication
    // GetPage(
    //   name: _Paths.signUpScreen,
    //   page: () => SignUp(),
    //   binding: AuthBinding(),
    // ),
    GetPage(
      name: _Paths.loginScreen,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    //
  ];
}
