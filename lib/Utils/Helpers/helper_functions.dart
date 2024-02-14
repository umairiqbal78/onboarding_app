import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:onboarding/Utils/Contants/colors.dart';
import 'package:onboarding/Utils/Themes/text_theme.dart';
import 'package:onboarding/Utils/Themes/theme.dart';

class XHelperFunctions {

  static void configLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..displayDuration = const Duration(seconds: 2)
      ..progressColor = XColors.primaryColor
      ..backgroundColor =  XColors.borderColor
      ..indicatorColor = XColors.primaryColor
      ..textColor =  XColors.textColor
      ..maskColor = XColors.primaryColor;
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showBotToast({required String text}) {
     BotToast.showText(
       backgroundColor: XColors.borderColor,
        textStyle: XTextThemes.lightTextTheme.bodyMedium!,
        contentColor: XColors.whiteColor,
        text: text);
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


}
