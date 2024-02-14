
import 'package:flutter/material.dart';
import 'package:onboarding/Common/Widgets/custom_text_field.dart';
import 'package:onboarding/Utils/Contants/colors.dart';
import 'package:onboarding/Utils/Device/device.dart';
import 'package:onboarding/Utils/Helpers/helper_functions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      XHelperFunctions.showSnackBar(text: "Welcome Login Screen");
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: XColors.whiteColor,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextFields(controller: TextEditingController())
              ],
            ),
          )),
    );
  }
}
