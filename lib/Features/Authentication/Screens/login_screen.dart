
import 'package:dijelac/Common/Widgets/custom_button.dart';
import 'package:dijelac/Features/Authentication/Controllers/auth_controller.dart';
import 'package:dijelac/Features/Authentication/Screens/authTemplate.dart';
import 'package:dijelac/Localization/keys.dart';
import 'package:dijelac/Routes/app_pages.dart';
import 'package:dijelac/Utils/Contants/sizes.dart';
import 'package:dijelac/Utils/Themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:dijelac/Common/Widgets/custom_text_field.dart';
import 'package:dijelac/Utils/Contants/colors.dart';
import 'package:dijelac/Utils/Helpers/helper_functions.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return AuthTemplate(
      child: GetBuilder<AuthController>(builder: (controller) {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: XHelperFunctions.screenWidth() * 0.20),
                  child: Column(
                    children: [
                      Text(
                          "SIGN IN",
                          style: XTextThemes.lightTextTheme.headlineLarge
                      ),
                      Divider(
                        height: 1,
                        thickness: 4,
                        color: XColors.textColor,

                      ),

                    ],
                  ),
                ),

                XSizes.sizeBoxXLg(),
                XSizes.sizeBoxXLg(),
                XCustomTextFields(
                  controller: controller.loginEmailController,
                  outlineBorderType: true,
                  hintText: "Email",
                  validationError: 'enter email address',
                  isEmail: true,
                ),
                XSizes.sizeBoxLg(),
                Obx(
                      () => XCustomTextFields(
                    controller: controller.loginPasswordController,
                    outlineBorderType: true,
                    hintText: "Password",
                    validationError: "enter password",
                    suffixContentPadding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    cursorColor: Colors.black,
                    obscureText: controller.loginShowPassword.value,
                    radiusCircle: 08,
                    textInputType: TextInputType.emailAddress,
                    suffix: GestureDetector(
                        onTap: () {
                          controller.loginShowPassword.value =
                          !controller.loginShowPassword.value;
                        },
                        child: Icon(
                          controller.loginShowPassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: XColors.textColor,
                          size: 18.0,
                        )),
                  ),
                ),
                XSizes.sizeBoxLg(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Checkbox(
                //       side: BorderSide(color: XColors.textColor, width: 1),
                //       activeColor: XColors.primaryColor,
                //       value: controller.acceptTCAndPP.value,
                //       onChanged: (value) {
                //         controller.acceptTCAndPP.value =
                //         !controller.acceptTCAndPP.value;
                //         controller.update();
                //       },
                //       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //     ),
                //
                //     SizedBox(
                //       width: XHelperFunctions.screenWidth() * 0.50,
                //       child:  Text(
                //         "Remember me",
                //         style: XTextThemes.lightTextTheme.titleSmall!.copyWith(
                //             fontSize: 16,
                //             fontWeight: FontWeight.w600,
                //             color: XColors.textColor,
                //             ),),
                //     ),
                //   ],
                // ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot password?",
                style: XTextThemes.lightTextTheme.titleSmall!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: XColors.textColor,
                    ),
                ),
            ),
                SizedBox(
                  height: XHelperFunctions.screenHeight() * 0.05,
                ),
                Center(
                  child: CustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // controller.signUp();
                        controller.allPasswordValidationChecks =
                            XHelperFunctions.validatePassword(
                                value: controller.passwordController.text,
                                onTap: true,
                                passwordValidationChecks:
                                controller.passwordValidationChecks,
                                allPasswordValidationChecks:
                                controller.allPasswordValidationChecks);
                        if (controller.allPasswordValidationChecks
                            .any((element) => element == false)) {
                          XHelperFunctions.showSnackBar(
                              text: LocalizationsKeys.passwordValidationMessage
                                  .translate(context));
                        }
                      }
                    },
                    btnText: "SIGN IN",
                  ),
                ),
                SizedBox(
                  height: XHelperFunctions.screenHeight() * 0.08,
                ),
                GestureDetector(
                  onTap: () {

                    controller.loginEmailController.clear();
                    controller.loginPasswordController.clear();
                    Get.toNamed(Routes.signUpScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                          style: XTextThemes.lightTextTheme.bodyMedium),
                      const SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        "Sign up for free",
                        style: XTextThemes.lightTextTheme.bodyMedium!
                            .copyWith(color: XColors.primaryColor,
                          fontWeight: FontWeight.w700,),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
