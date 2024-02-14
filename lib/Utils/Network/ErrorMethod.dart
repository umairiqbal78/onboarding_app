import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/Routes/app_pages.dart';
import 'package:onboarding/Utils/Contants/colors.dart';
import 'package:onboarding/Utils/Helpers/helper_functions.dart';


dynamic returnResponse(dio.Response? responseData) {
  if (responseData == null) {
    XHelperFunctions.showSnackBar(text: 'Internet Error');
  } else {
    switch (responseData.statusCode) {
      case 200:
        var responseJson = json.decode(responseData.data.toString());
        //print(responseJson);
        return responseJson;
      case 302:
        Get.defaultDialog(
          backgroundColor: XColors.secondaryColor,
          titleStyle: Theme.of(Get.context!).textTheme.titleMedium,
          title: "Session has been expired",
          middleText: "",
        );
        Get.offAllNamed(Routes.loginScreen);
        break;
      case 400:
        XHelperFunctions.showSnackBar(text: responseData.data["data"].toString());
        break;
      case 401:
        if (responseData.data["message"] == "Unauthenticate") {
          Get.offNamed(Routes.loginScreen);
          XHelperFunctions.showSnackBar(text: "Session has been expired");
        } else {
          XHelperFunctions.showSnackBar(text: responseData.data["data"].toString());
        }

        break;
      case 404:
        XHelperFunctions.showSnackBar(text: responseData.data["data"].toString());
        break;
      case 403:
        XHelperFunctions.showSnackBar(text: responseData.data["data"].toString());
        break;
      case 422:
        XHelperFunctions.showSnackBar(text: responseData.data["message"].toString());
        break;
      case 500:
      default:
        throw XHelperFunctions.showSnackBar(
            text: ('Error occurred while Communication with Server with StatusCode : ${responseData.statusCode}'));
    }
  }
}
