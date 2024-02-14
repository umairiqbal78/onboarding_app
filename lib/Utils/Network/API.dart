import 'dart:async';


import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get_storage/get_storage.dart';
import 'package:onboarding/Utils/Network/ErrorMethod.dart';

import 'Url.dart';

class API {
  ///SingleTon
  static final API _singleton = API._internal();
  var sp = GetStorage();
  factory API() {
    return _singleton;
  }
  Dio dio = Dio(BaseOptions(
    connectTimeout: const Duration(milliseconds: 10000),
    receiveTimeout: const Duration(milliseconds: 90000),
  ));

  API._internal();
  Dio addInterceptors() {
    return dio
      ..interceptors.add(InterceptorsWrapper(
          onError: (dioError, interceptorErrorCallback) async {
        returnResponse(dioError.response!);
      }));
  }

  ///Get
  Future<dynamic> getApi({url, fullUrl, queryParams, loader}) async {
    dio.options.headers['Authorization'] = "Bearer ${sp.read('token')}";
    dio.options.headers['Accept'] = "application/json";
    if (loader == true) {
      EasyLoading.show();
    }
    if (url != "") {
      try {
        final response = await dio.get(fullUrl ?? Url().baseUrl + url,
            queryParameters: queryParams);
        if (loader == true) {
          EasyLoading.dismiss();
        }
        return response;
      } on DioException catch (e) {
        EasyLoading.dismiss();
        return returnResponse(e.response);
      }
    }
  }

  ///Post
  Future<dynamic> postApi(
    formData,
    url, {
    auth = true,
    multiPart = false,
    showProgress = false,
    context,
    loader,
  }) async {
    try {
      if (auth == true) {

        dio.options.headers['Authorization'] = "Bearer ${sp.read('token')}";
        dio.options.headers['Accept'] = "application/json";
      }
      if (loader == true) {
        EasyLoading.show();
      }
      if (!showProgress) {
        dynamic response = await dio.post(
          Url().baseUrl + url,
          data: formData,
        );
        EasyLoading.dismiss();
        return response;
      } else {
        dynamic response = await dio.post(Url().baseUrl + url, data: formData,
            onSendProgress: (int progress, int total) {
        });
        EasyLoading.dismiss();
        return response;
      }
    } on DioException catch (e) {
      EasyLoading.dismiss();
      return returnResponse(e.response);
    }
  }

  ///Put
  Future<dynamic> putApi(
    formData,
    url, {
    auth = true,
    multiPart = false,
    showProgress = false,
    context,
    loader,
  }) async {
    try {
      if (auth == true) {
        dio.options.headers['Authorization'] = "Bearer ${sp.read('token')}";
        dio.options.headers['Accept'] = "application/json";
        dio.options.headers['Content-type'] =
            "application/x-www-form-urlencoded";
      }
      if (loader == true) {
        EasyLoading.show();
      }
      if (!showProgress) {
        dynamic response = await dio.put(
          Url().baseUrl + url,
          data: formData,
        );
        EasyLoading.dismiss();
        return response;
      } else {
        dynamic response = await dio.put(Url().baseUrl + url, data: formData,
            onSendProgress: (int progress, int total) {
        });
        EasyLoading.dismiss();
        return response;
      }
    } on DioException catch (e) {
      EasyLoading.dismiss();
      return returnResponse(e.response);
    }
  }

  ///Delete
  Future<dynamic> deleteApi(
    formData,
    url, {
    auth = true,
    multiPart = false,
    showProgress = false,
    context,
    loader,
  }) async {
    print(Url().baseUrl + url);

    try {
      if (auth == true) {
        dio.options.headers['Authorization'] = "Bearer ${sp.read('token')}";
        dio.options.headers['Accept'] = "application/json";
        dio.options.headers['Content-type'] =
            "application/x-www-form-urlencoded";
      }
      if (loader == true) {
        EasyLoading.show();
      }
      if (!showProgress) {
        dynamic response = await dio.delete(
          Url().baseUrl + url,
          data: formData,
        );
        EasyLoading.dismiss();
        return response;
      } else {
        // progressAlert(context, 100);
        dynamic response = await dio.delete(
          Url().baseUrl + url,
          data: formData,
        );
        EasyLoading.dismiss();
        return response;
      }
    } on DioException catch (e) {
      EasyLoading.dismiss();
      // if (loader == true) {
      //   EasyLoading.dismiss();
      // }
      return returnResponse(e.response);
    }
  }
}