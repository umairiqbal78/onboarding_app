import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:onboarding/Utils/Contants/colors.dart';
import 'package:onboarding/Utils/Themes/text_theme.dart';

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


}
