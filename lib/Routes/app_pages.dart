import 'package:dijelac/Bindings/bottom_nav_bar_binding.dart';
import 'package:dijelac/Features/Authentication/Screens/sign_up_screen.dart';
import 'package:dijelac/Features/BottomNavBar/bottom_nav_bar.dart';
import 'package:dijelac/Features/OnBoardingAndSplash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:dijelac/Bindings/auth_binding.dart';
import 'package:dijelac/Features/Authentication/Screens/login_screen.dart';


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
    GetPage(
      name: _Paths.signUpScreen,
      page: () => const SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.loginScreen,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    /// Home
    GetPage(
      name: _Paths.bottomNavBar,
      page: () => const CustomBottomNavBar(),
      binding: BottomNavBarBinding(),
    ),
  ];
}
