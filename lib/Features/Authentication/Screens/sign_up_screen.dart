import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:dijelac/Common/Widgets/custom_button.dart';
import 'package:dijelac/Common/Widgets/custom_dropdownfield.dart';
import 'package:dijelac/Common/Widgets/custom_text_field.dart';
import 'package:dijelac/Features/Authentication/Controllers/auth_controller.dart';
import 'package:dijelac/Features/Authentication/Screens/authTemplate.dart';
import 'package:dijelac/Localization/keys.dart';
import 'package:dijelac/Routes/app_pages.dart';
import 'package:dijelac/Utils/Contants/colors.dart';
import 'package:dijelac/Utils/Contants/sizes.dart';
import 'package:dijelac/Utils/Helpers/helper_functions.dart';
import 'package:dijelac/Utils/Themes/text_theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthController controller = Get.find();
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
                  padding: EdgeInsets.symmetric(
                      horizontal: XHelperFunctions.screenWidth() * 0.20),
                  child: Column(
                    children: [
                      Text("SIGN UP",
                          style: XTextThemes.lightTextTheme.headlineLarge),
                      Divider(
                        height: 1,
                        thickness: 4,
                        color: XColors.textColor,
                      ),
                    ],
                  ),
                ),

                XSizes.sizeBoxXLg(),
                Text(
                  "Personal information",
                  style: XTextThemes.lightTextTheme.headlineSmall,
                ),
                Divider(
                  height: 1,
                  thickness: 2,
                  color: XColors.textColor,
                  endIndent: XHelperFunctions.screenWidth() * 0.35,
                ),
                XSizes.sizeBoxXLg(),
                XCustomTextFields(
                  controller: controller.fullNameController,
                  outlineBorderType: true,
                  hintText: "Full name",
                  validationError: 'enter full name',
                  isName: true,
                ),
                XSizes.sizeBoxLg(),
                XCustomTextFields(
                  controller: controller.emailController,
                  outlineBorderType: true,
                  hintText: "Email",
                  validationError:  LocalizationsKeys.pleaseEnterYourEmailAddress.translate(context),
                  isEmail: true,
                ),
                XSizes.sizeBoxLg(),
                Obx(
                  () => XCustomTextFields(
                    controller: controller.passwordController,
                    outlineBorderType: true,
                    hintText: "Password",
                    validationError: "enter password",
                    suffixContentPadding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    isPassword: true,
                    cursorColor: Colors.black,
                    obscureText: controller.signUpShowPassword.value,
                    radiusCircle: 08,
                    textInputType: TextInputType.emailAddress,
                    suffix: GestureDetector(
                        onTap: () {
                          controller.signUpShowPassword.value =
                              !controller.signUpShowPassword.value;
                        },
                        child: Icon(
                          controller.signUpShowPassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: XColors.textColor,
                          size: 18.0,
                        )),
                  ),
                ),
                // XSizes.sizeBoxMm(),
                // StrongPasswordValidationsList(
                //   passwordValidationChecks: controller.passwordValidationChecks,
                // ),
                XSizes.sizeBoxLg(),
                XCustomTextFields(
                  getController: controller,
                  controller: controller.retypePasswordController,
                  outlineBorderType: true,
                  isConfirmPassword: true,
                  isPassword: true,
                  hintText: "Confirm password",
                  validationError: "enter confirm password",
                  obscureText: controller.showRetypePassword.value,
                  suffix: GestureDetector(
                      onTap: () {
                        controller.showRetypePassword.value =
                            !controller.showRetypePassword.value;
                        controller.update();
                      },
                      child: Icon(
                        controller.showRetypePassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: XColors.textColor,
                        size: 18.0,
                      )),
                ),
                XSizes.sizeBoxSm(),
                Obx(
                  () => CheckboxListTile(
                    value: controller.areYouABusiness.value,
                    onChanged: (value) {
                      controller.areYouABusiness.value =
                          !controller.areYouABusiness.value;
                      controller.update();
                    },
                    tileColor: Colors.transparent,
                    title: Text(
                      "Are you a business?",
                      style: XTextThemes.lightTextTheme.titleSmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: XColors.textColor,
                          decoration: TextDecoration.underline),
                    ),
                    side: BorderSide(color: XColors.textColor, width: 1),
                    contentPadding: const EdgeInsets.only(left: 12),
                    activeColor: XColors.primaryColor,
                  ),
                ),
                XSizes.sizeBoxSm(),
                if (!controller.areYouABusiness.value)
                  Column(
                    children: [
                      XCustomDropDownField(
                        controller: controller,
                        context: context,
                        textController:controller.genderController,
                        value: controller.gender,
                        hintText: 'Select gender',
                        dropDownList: controller.genderOptions,
                      ),
                      XSizes.sizeBoxLg(),
                      DateTimeField(
                        controller: controller.dateOfBirthController,
                        style: XTextThemes.lightTextTheme.bodyMedium,
                        readOnly: true,
                        resetIcon: null,
                        scrollPadding: EdgeInsets.zero,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          errorStyle: XTextThemes.lightTextTheme.bodySmall!
                              .copyWith(color: XColors.redColor, fontSize: 10),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.birthDate = null;
                              controller.pickedCurrentDate = null;
                              controller.dateOfBirthController.clear();
                              controller.update();
                            },
                            child: Icon(
                              Icons.cancel_rounded,
                              color: XColors.hintTextColor,
                              size: 18,
                            ),
                          ),
                          hintText: "tap to select birth date",
                          hintStyle: XTextThemes.lightTextTheme.bodyMedium!
                              .copyWith(
                                  fontStyle: FontStyle.italic,
                                  color: XColors.hintTextColor),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: XColors.textColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: XColors.textColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: XColors.textColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: XColors.textColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: XColors.redColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        format: controller.format,
                        onChanged: (currentValue) {
                          controller.pickedCurrentDate = currentValue;

                          print("selected date now $currentValue");
                          String currentDate = currentValue.toString();
                          List<String> selectedDate = currentDate.split(" ");
                          controller.birthDate = selectedDate[0];
                          controller.update();
                        },
                        validator: (value) {
                          if (value == null) {
                            return "Please select birth date";
                          } else {
                            return null;
                          }
                        },
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: XColors.primaryColor,
                                      onPrimary:
                                          Colors.black, // header text color
                                      onSurface:
                                          XColors.textColor, // body text color
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                      ),
                    ],
                  )
                else
                  XCustomTextFields(
                    controller: controller.companyName,
                    outlineBorderType: true,
                    hintText: "Company name",
                    validationError: 'enter company name',
                  ),
                XSizes.sizeBoxLg(),
                XCustomTextFields(
                  controller: controller.phoneNumberController,
                  numberInputFormatter: true,
                  hintText: "Phone number",
                  validationError: 'enter phone number',
                ),
                XSizes.sizeBoxSm(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: XColors.textColor,
                      size: 18,
                    ),
                    SizedBox(
                      width: XSizes.md,
                    ),
                    SizedBox(
                      width: XHelperFunctions.screenWidth() * 0.75,
                      child: Text(
                          "We use this information to prevent fraud by verifying user identity and to send operational messages",
                          style: XTextThemes.lightTextTheme.labelMedium),
                    ),
                  ],
                ),
                SizedBox(
                  height: XHelperFunctions.screenHeight() * 0.02,
                ),
                Text(
                  "Location information",
                  style: XTextThemes.lightTextTheme.headlineSmall,
                ),
                Divider(
                  height: 1,
                  thickness: 2,
                  color: XColors.textColor,
                  endIndent: XHelperFunctions.screenWidth() * 0.35,
                ),
                XSizes.sizeBoxXLg(),
                XCustomTextFields(
                  controller: controller.streetNameController,
                  hintText: "Street name",
                  validationError: 'enter street name',
                ),

                XSizes.sizeBoxSm(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: XColors.textColor,
                      size: 18,
                    ),
                    SizedBox(
                      width: XSizes.md,
                    ),
                    SizedBox(
                      width: XHelperFunctions.screenWidth() * 0.75,
                      child: Text(
                          "We use this information to show you relevant articles close to your address.",
                          style: XTextThemes.lightTextTheme.labelMedium),
                    ),
                  ],
                ),
                XSizes.sizeBoxLg(),
                XCustomTextFields(
                  controller: controller.streetNumberController,
                  hintText: "Street number",
                  validationError: 'enter street number',
                ),
                XSizes.sizeBoxLg(),
                XCustomTextFields(
                  controller: controller.cityController,
                  hintText: "City",
                  validationError: 'enter city',
                ),
                XSizes.sizeBoxLg(),
                XCustomTextFields(
                  controller: controller.zipCodeController,
                  hintText: "Zip Code",
                  validationError: 'enter zip code',
                ),
                XSizes.sizeBoxXLg(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Checkbox(
                      side: BorderSide(color: XColors.textColor, width: 1),
                      activeColor: XColors.primaryColor,
                      value: controller.acceptTCAndPP.value,
                      onChanged: (value) {
                        controller.acceptTCAndPP.value =
                            !controller.acceptTCAndPP.value;
                        controller.update();
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    SizedBox(
                      width: XSizes.md,
                    ),
                    SizedBox(
                      width: XHelperFunctions.screenWidth() * 0.70,
                      child: RichText(
                        text: TextSpan(
                          text: 'I accept ',
                          style: XTextThemes.lightTextTheme.bodyMedium,
                          children: [
                            TextSpan(
                              text: 'terms and conditions',
                              style: XTextThemes.lightTextTheme.bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: XColors.primaryColor,
                                      letterSpacing: 0.5),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Add your logic for handling the terms and conditions click
                                },
                            ),
                            TextSpan(
                              text: ' and the ',
                              style: XTextThemes.lightTextTheme.bodyMedium,
                            ),
                            TextSpan(
                              text: 'privacy policy',
                              style: XTextThemes.lightTextTheme.bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                  color: XColors.primaryColor,
                                      letterSpacing: 0.5),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Add your logic for handling the privacy policy click
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                    btnText: "SIGN UP",
                  ),
                ),
                SizedBox(
                  height: XHelperFunctions.screenHeight() * 0.08,
                ),
                GestureDetector(
                  onTap: () {
                    controller.fullNameController.clear();
                    controller.emailController.clear();
                    controller.passwordController.clear();
                    Get.toNamed(Routes.loginScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style: XTextThemes.lightTextTheme.bodyMedium),
                      const SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        "Sign in",
                        style: XTextThemes.lightTextTheme.bodyMedium!
                            .copyWith(color: XColors.primaryColor),
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
