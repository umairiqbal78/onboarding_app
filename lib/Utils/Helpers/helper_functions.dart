import 'package:dijelac/Common/Widgets/Auth/validation_password_checks_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dijelac/Utils/Contants/colors.dart';
import 'package:dijelac/Utils/Themes/text_theme.dart';

class XHelperFunctions {

  static  showSnackBar({required String text}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(backgroundColor: XColors.primaryColor, content: Text(text,style: XTextThemes.lightTextTheme.titleMedium!.copyWith(color: XColors.whiteColor),)),
    );
  }
  static void showLoading() {
     const SpinKitCircle(color: Colors.white,);
  }

  static void stopLoading() {
    const SpinKitCircle(color: Colors.white,).controller?.stop();
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ), // TextButton
          ],
        ); // AlertDialog
      },
    );
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.sizeOf(Get.context!).height;
  }

  static double screenWidth() {
    return MediaQuery.sizeOf(Get.context!).width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  static List<bool> validatePassword({
    required String value,
    bool onTap = false,
    required PasswordValidationChecks passwordValidationChecks,
    required List<bool> allPasswordValidationChecks,
  }) {
    allPasswordValidationChecks.clear();

    /// 8 characters long
    const String mustContain8Charac = '.{8,}';
    final RegExp mustContain8CharacRegex = RegExp(mustContain8Charac);
    if (!mustContain8CharacRegex.hasMatch(value)) {
      if (onTap) {
        passwordValidationChecks.validationOfAtleast8Characters = false;
        allPasswordValidationChecks.add(passwordValidationChecks.validationOfAtleast8Characters);
      } else {
        passwordValidationChecks.validationOfAtleast8Characters = false;
      }
    } else {
      passwordValidationChecks.validationOfAtleast8Characters = true;
      allPasswordValidationChecks.add(passwordValidationChecks.validationOfAtleast8Characters);
    }

    /// a lowercase
    const String mustContainalowerCase = '(?=.*?[a-z])';
    final RegExp mustContainalowerCaseRegex = RegExp(mustContainalowerCase);
    if (!mustContainalowerCaseRegex.hasMatch(value)) {
      if (onTap) {
        passwordValidationChecks.validationOfaLowerCase = false;
        allPasswordValidationChecks.add(passwordValidationChecks.validationOfaLowerCase);
      } else {
        passwordValidationChecks.validationOfaLowerCase = false;
      }
    } else {
      passwordValidationChecks.validationOfaLowerCase = true;
      allPasswordValidationChecks.add(passwordValidationChecks.validationOfaLowerCase);
    }

    /// an uppercase
    const String mustContainanUpperCase = '(?=.*?[A-Z])';
    final RegExp mustContainanUpperCaseRegex = RegExp(mustContainanUpperCase);
    if (!mustContainanUpperCaseRegex.hasMatch(value)) {
      if (onTap) {
        passwordValidationChecks.validationOfanUpperCase = false;
        allPasswordValidationChecks.add(passwordValidationChecks.validationOfanUpperCase);
      } else {
        passwordValidationChecks.validationOfanUpperCase = false;
      }
    } else {
      passwordValidationChecks.validationOfanUpperCase = true;
      allPasswordValidationChecks.add(passwordValidationChecks.validationOfanUpperCase);
    }

    /// a number
    const String mustContainaNumber = '(?=.*?[0-9])';
    final RegExp mustContainaNumberRegex = RegExp(mustContainaNumber);
    if (!mustContainaNumberRegex.hasMatch(value)) {
      if (onTap) {
        passwordValidationChecks.validationOfaNumber = false;
        allPasswordValidationChecks.add(passwordValidationChecks.validationOfaNumber);
      } else {
        passwordValidationChecks.validationOfaNumber = false;
      }
    } else {
      passwordValidationChecks.validationOfaNumber = true;
      allPasswordValidationChecks.add(passwordValidationChecks.validationOfaNumber);
    }

    /// a special character
    const String mustContainSpecialCharacter = '(?=.*?[.!@#\$%^()&*~])';
    final RegExp mustContainSpecialCharacterRegex = RegExp(mustContainSpecialCharacter);
    if (!mustContainSpecialCharacterRegex.hasMatch(value)) {
      if (onTap) {
        passwordValidationChecks.validationOfaSpecialCase = false;
        allPasswordValidationChecks.add(passwordValidationChecks.validationOfaSpecialCase);
      } else {
        passwordValidationChecks.validationOfaSpecialCase = false;
      }
    } else {
      passwordValidationChecks.validationOfaSpecialCase = true;
      allPasswordValidationChecks.add(
          passwordValidationChecks.validationOfaSpecialCase);
    }
    return allPasswordValidationChecks;
  }
}
