
import 'package:get/get.dart';
import 'package:dijelac/Features/Authentication/Controllers/auth_controller.dart';


class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
