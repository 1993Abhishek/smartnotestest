import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smartnotestest/core/helper/app_helper.dart';
import 'package:smartnotestest/core/manager/SCR_URLS.dart';
import 'package:smartnotestest/core/manager/static_data_manager.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/ui/helper/app_strings.dart';

class RemoteRepository {
  Dio _dioGeneral;
  Dio _oieServDio;

  RemoteRepository() {
    _oieServDio = Dio(BaseOptions(
      baseUrl: SCRAppURLS.base_url,
      headers: {"Content-Type": "application/json"},
      connectTimeout: 60000,
      receiveTimeout: 60000,
    ));
    _oieServDio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      debugPrint(
          "\n\n!******************API DETAILS*************************!\n");
      debugPrint("REST URL => ${options.baseUrl}${options.path}");
      debugPrint("REST METHOD => ${options.method}");
      debugPrint("CONTENT TYPE => ${options.contentType}");
      debugPrint("REST API PARAMENETRS => ${options.data}");
      return options; //continue
    }, onResponse: (Response response) async {
      debugPrint("\n!---------------API RESPONSE--------------------!");
      int maxCharactersPerLine = 200;
      String responseAsString = response.data.toString();
      if (responseAsString.length > maxCharactersPerLine) {
        int iterations =
        (responseAsString.length / maxCharactersPerLine).floor();
        for (int i = 0; i <= iterations; i++) {
          int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
          if (endingIndex > responseAsString.length) {
            endingIndex = responseAsString.length;
          }
          print(responseAsString.substring(
              i * maxCharactersPerLine, endingIndex));
        }
      } else {
        print(response.data);
      }
      debugPrint("!---------------END API RESPONSE--------------------!");
      debugPrint("\n!******************END*************************!\n\n");
      return response; // continue
    }, onError: (DioError e) async {
      debugPrint("\n!############API ERROR##############!");
      debugPrint("API ERROR => ${e.toString()}");
      debugPrint("\n!******************END*************************!\n\n");
      return e;
    }));
    _dioGeneral = Dio(BaseOptions(
      headers: {"Content-Type": "application/json"},
      connectTimeout: 60000,
      receiveTimeout: 60000,
    ));
    _dioGeneral.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      debugPrint(
          "\n\n!******************API DETAILS*************************!\n");
      debugPrint("REST URL => ${options.baseUrl}${options.path}");
      debugPrint("REST METHOD => ${options.method}");
      debugPrint("CONTENT TYPE => ${options.contentType}");
      return options; //continue
    }, onResponse: (Response response) async {
      debugPrint("\n!---------------API RESPONSE--------------------!");
      int maxCharactersPerLine = 200;
      String responseAsString = response.data.toString();
      if (responseAsString.length > maxCharactersPerLine) {
        int iterations =
        (responseAsString.length / maxCharactersPerLine).floor();
        for (int i = 0; i <= iterations; i++) {
          int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
          if (endingIndex > responseAsString.length) {
            endingIndex = responseAsString.length;
          }
          print(responseAsString.substring(
              i * maxCharactersPerLine, endingIndex));
        }
      } else {
        print(response.data);
      }
      debugPrint("!---------------END API RESPONSE--------------------!");
      debugPrint("\n!******************END*************************!\n\n");
      return response; // continue
    }, onError: (DioError e) async {
      debugPrint("\n!############API ERROR##############!");
      debugPrint("API ERROR => ${e.toString()}");
      debugPrint("\n!******************END*************************!\n\n");
      return e;
    }));
  }

  Future<SCRResponseModel> postRequest({@required String apiEndPoint,
    dynamic params,
    bool isRawResponse = false,
    String dataResponseKey = "",
    String dataResponseKeyExtra = ""}) async {
    debugPrint("params===>$params");
    if (await AppHelper.isInternetConnectionAvailable()) {
      try {
        Response remoteResponse =
        await _oieServDio.post(apiEndPoint, data: params);
        if (isRawResponse)
          return SCRResponseModel.fromRawResponse(remoteResponse);
        else
          return SCRResponseModel.fromResponse(remoteResponse,
              dataResponseKey: dataResponseKey,
              dataResponseKeyExtra: dataResponseKeyExtra);
      } catch (error, stacktrace) {
        debugPrint("Exception occured: $error stackTrace: $stacktrace");
        return SCRResponseModel.withError(error);
      }
    } else {
      debugPrint("NO INTERNET CONNECTION!!");
      return Future.value(SCRResponseModel(
          responseStatus: StaticDataManager.statusCodeNoInternet,
          responseMessage: AppStrings.noInternetConnection,
          result: false));
    }
  }

  Future<SCRResponseModel> getRequest({@required String apiEndPoint,
    dynamic params,
    bool isRawResponse = false,
    String dataResponseKey = "",
    String dataResponseKeyExtra = ""}) async {
    debugPrint("params===>$params");
    if (await AppHelper.isInternetConnectionAvailable()) {
      try {
        Response remoteResponse =
        await _oieServDio.get(apiEndPoint, queryParameters: params);
        if (isRawResponse)
          return SCRResponseModel.fromRawResponse(remoteResponse);
        else
          return SCRResponseModel.fromResponse(remoteResponse,
              dataResponseKey: dataResponseKey,
              dataResponseKeyExtra: dataResponseKeyExtra);
      } catch (error, stacktrace) {
        debugPrint("Exception occured: $error stackTrace: $stacktrace");
        return SCRResponseModel.withError(error);
      }
    } else {
      debugPrint("NO INTERNET CONNECTION!!");
      return Future.value(SCRResponseModel(
          responseStatus: StaticDataManager.statusCodeNoInternet,
          responseMessage: AppStrings.noInternetConnection,
          result: false));
    }
  }

  Future<SCRResponseModel> NotificationMultiPartRequest(
      {@required String apiEndPoint,
        @required Map<String, dynamic> params,
        String filePath,
        String filePathParam,
        bool isRawResponse = false,
        String dataResponseKey = ""}) async {
    debugPrint("---------OieServMultiPartRequest----------");
    debugPrint("params===>$params");
    debugPrint("filePathParam===>$filePathParam");
    debugPrint("filePath===>$filePath");
    if (await AppHelper.isInternetConnectionAvailable()) {
      try {
        if (filePathParam.isNotEmpty &&
            filePath.isNotEmpty &&
            File(filePath).existsSync()) {
          params.addAll({
            filePathParam: await MultipartFile.fromFile(filePath),
          });
        }
        FormData formData = FormData.fromMap(params);
        Response remoteResponse =
        await _oieServDio.post(apiEndPoint, data: formData);
        if (isRawResponse)
          return SCRResponseModel.fromRawResponse(remoteResponse);
        else
          return SCRResponseModel.fromResponse(remoteResponse,
              dataResponseKey: dataResponseKey);
      } catch (error, stacktrace) {
        debugPrint("Exception occured: $error stackTrace: $stacktrace");
        return SCRResponseModel.withError(error);
      }
    } else {
      debugPrint("NO INTERNET CONNECTION!!");
      return Future.value(SCRResponseModel(
          responseStatus: StaticDataManager.statusCodeNoInternet,
          responseMessage: AppStrings.noInternetConnection,
          result: false));
    }
  }
}
