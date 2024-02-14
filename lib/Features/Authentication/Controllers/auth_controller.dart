import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart' as form;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onboarding/Routes/app_pages.dart';
import 'package:onboarding/Utils/Contants/colors.dart';
import 'package:onboarding/Utils/Helpers/helper_functions.dart';
import 'package:onboarding/Utils/Network/API.dart';
import 'package:onboarding/Utils/Themes/text_theme.dart';


class AuthController extends GetxController {
  var sp = GetStorage();

  ///sign Up
  final fullNameController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool signUpShowPassword = true.obs;
  signUp() async {

    var formData = form.FormData.fromMap({
      "name": fullNameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "password_confirmation": passwordController.text,

    });
    print(formData);
    var response = await API().postApi(
      formData,
      '/register',
      loader: true,
    );
    if (response.statusCode == 200) {
      fullNameController.clear();
      emailController.clear();
      passwordController.clear();

      ///token save
      API().sp.write('token', response.data['data']['token']);
      print("token ========> ${API().sp.read('token')}");

      ///id save
      API().sp.write('id', response.data['data']['user_details']['id']);
      print("user id========>${response.data['data']['user_details']['id']}");

      // Get.offNamed(Routes.createProfile1);
    }
  }

  /// login
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  login() async {
    var formData = form.FormData.fromMap({
      "email": loginEmailController.text,
      "password": loginPasswordController.text,
    });
    print(formData);
    var response = await API().postApi(
      formData,
      '/login',
      loader: true,
    );
    if (response.statusCode == 200) {
      loginEmailController.clear();
      loginPasswordController.clear();

      ///token save
      API().sp.write('token', response.data['data']['token']);
      print("token ========> ${API().sp.read('token')}");

      ///id save
      API().sp.write('id', response.data['data']['user_details']['id']);
      print("user id========>${response.data['data']['user_details']['id']}");
      // if (response.data['data']['user_details']['location'] == null) {
      //   Get.offNamed(Routes.createProfile1);
      // } else {
      //   Get.offNamed(Routes.customBottomNavBar);
      // }
    }
  }


  ///sign up post request

  final ImagePicker _picker = ImagePicker();

  bottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: XColors.secondaryColor,
        context: context,
        builder: (BuildContext abc) {
          return Wrap(
            children: [
              ListTile(
                onTap: () async {
                  Navigator.of(context).pop();
                  _camera(context);
                  // await
                  // Get.back();
                },
                leading: Icon(
                  Icons.camera_alt,
                  color: XColors.primaryColor,
                ),
                title: Text(
                  'Camera',
                  style:XTextThemes.lightTextTheme.bodyMedium,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  _gallery(context);
                },
                leading: Icon(
                  Icons.image,
                  color: XColors.primaryColor,
                ),
                title: Text(
                  'Gallery',
                  style:XTextThemes.lightTextTheme.bodyMedium,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.back();
                },
                leading: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: XColors.primaryColor),
                  ),
                  child: Icon(
                    Icons.close,
                    color: XColors.primaryColor,
                  ),
                ),
                title: Text(
                  'Cancel',
                  style: XTextThemes.lightTextTheme.bodyMedium,
                ),
              ),
            ],
          );
        });
  }

  XFile? files;
  _camera(context) async {
    try {
      files = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 40,
        maxHeight: 1920,
        maxWidth: 1080,
      );
      files ??= null;
      if (files != null) {
        // MultiImageCrop.startCropping(
        //     context: context,
        //     aspectRatio: 6 / 3,
        //     activeColor: XColors.primaryColor,
        //     pixelRatio: 3,
        //     files: List.generate(1, (index) => File(files!.path)),
        //     callBack: (List<File> images) {
        //       files = XFile(images[0].path);
        //       update();
        //     });
      }
      update();
    } catch (e) {
      XHelperFunctions.showSnackBar(text: e.toString());
    }
  }

  _gallery(context) async {
    try {
      files = await _picker.pickImage(
          source: ImageSource.gallery,
          maxWidth: 1080,
          maxHeight: 1920,
          imageQuality: 40);

      files ??= null;
      if (files != null) {
        // MultiImageCrop.startCropping(
        //     context: context,
        //     aspectRatio: 6 / 3,
        //     activeColor: XColors.primaryColor,
        //     pixelRatio: 3,
        //     files: List.generate(1, (index) => File(files!.path)),
        //     callBack: (List<File> images) {
        //       files = XFile(images[0].path);
        //       update();
        //     });
      }

      update();
    } catch (e) {
      XHelperFunctions.showSnackBar(text: e.toString());

    }
  }



  Timer? timer;
  RxInt start = 30.obs;

  void startTimer() {
    start.value = 30;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
  }

  void disposeTimer() {
    timer!.cancel();
  }



  signOut() async {
    var fromData;
    var response = await API().postApi(fromData, 'logout', loader: true);
    if (response.statusCode == 200) {
      API().sp.remove("id");

      XHelperFunctions.showSnackBar(text:  response.data['message']);
      Get.offAllNamed(
        Routes.loginScreen,
      );
    }
  }
}
