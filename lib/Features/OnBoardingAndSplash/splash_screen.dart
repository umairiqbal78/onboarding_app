import 'dart:async';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onboarding/Routes/app_pages.dart';
import 'package:onboarding/Utils/Contants/colors.dart';
import 'package:onboarding/Utils/Helpers/helper_functions.dart';
import 'package:onboarding/Utils/Local_Storage/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var sp = GetStorage();
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      if (XLocalStorage().readData<String>('token') != null) {
      } /*else if (sp.read('initial') == null) {
        sp.write("initial", "true");
        Get.offAllNamed(Routes.loginScreen);
      } */else {
        XHelperFunctions.showBotToast(text: "Login Screen");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: XColors.whiteColor,
        ),
        child: Image.asset(
          "assets/logos/app_logo.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
