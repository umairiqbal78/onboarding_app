import 'dart:convert';


import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/Routes/app_pages.dart';
import 'package:onboarding/Utils/Contants/colors.dart';
import 'package:onboarding/Utils/Contants/colors.dart';

dynamic returnResponse(dio.Response? responseData) {
  if (responseData == null) {
    BotToast.showText(text: 'Internet Error');
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
        BotToast.showText(text: responseData.data["data"].toString());
        break;
      case 401:
        if (responseData.data["message"] == "Unauthenticate") {
          Get.offNamed(Routes.loginScreen);
          BotToast.showText(text: "Session has been expired");
        } else {
          BotToast.showText(text: responseData.data["data"].toString());
        }

        break;
      case 404:
        BotToast.showText(text: responseData.data["data"].toString());
        break;
      case 403:
        BotToast.showText(text: responseData.data["data"].toString());
        break;
      case 422:
        BotToast.showText(text: responseData.data["message"].toString());
        break;
      case 500:
      default:
        throw BotToast.showText(
            text:
                ('Error occurred while Communication with Server with StatusCode : ${responseData.statusCode}'));
    }
  }
}
