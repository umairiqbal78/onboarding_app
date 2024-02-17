import 'package:dijelac/Features/BottomNavBar/Controller/bottomNavController.dart';
import 'package:get/get.dart';


class BottomNavBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavBarController>(() => BottomNavBarController());
  }
}
