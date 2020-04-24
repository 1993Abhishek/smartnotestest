import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smartnotestest/core/manager/static_data_manager.dart';

class SCRResponseModel {
  int responseStatus;
  int rawResponseStatus;
  String responseMessage;
  int user_id;
  bool result;
  dynamic dataResponse;
  dynamic dataResponseExtra;

  SCRResponseModel(
      {@required this.responseStatus, @required this.responseMessage, this.result});

  SCRResponseModel.fromResponse(Response response,
      {String dataResponseKey = "", String dataResponseKeyExtra = ""}) {
    debugPrint("Self Care response data==>${response.data}\n");
    try {
      rawResponseStatus = response.statusCode;
      Map<String, dynamic> responseMap = response.data;
      responseMessage = responseMap['message'];
      result = responseMap["result"];
//      user_id = responseMap['user_data']['user_id'];

//      print("***************************************${user_id}****************************************************************");

      if (dataResponseKey.isNotEmpty && responseMap[dataResponseKey] != null) {
        dataResponse = responseMap[dataResponseKey];
      }

      if (dataResponseKeyExtra.isNotEmpty &&
          responseMap[dataResponseKeyExtra] != null) {
        dataResponseExtra = responseMap[dataResponseKeyExtra];
      }
    } on Exception {
      responseStatus = 0;
      responseMessage = "Invalid Format!";
    }
  }

  SCRResponseModel.fromRawResponse(Response response,
      {String dataResponseKey = ""}) {
    debugPrint("IMailResponseModel response data==>${response.data}");
    rawResponseStatus = response.statusCode;
    responseStatus = response.statusCode;
    responseMessage = response.statusMessage;
    dataResponse = response.data;
  }

  SCRResponseModel.withError(DioError error) {
    responseStatus = StaticDataManager.statusCodeInternalServerError;
    rawResponseStatus = responseStatus;
    responseMessage = _handleError(error);
  }

  String _handleError(DioError error) {
    String errorDescription = "";
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
          "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
          "Received invalid status code: ${error.response.statusCode}";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Send timeout in connection";
          break;
        default:
          errorDescription = "Something went Wrong. Please try after sometime";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }

  @override
  String toString() {
    return 'SCRResponseModel{responseStatus: $responseStatus, rawResponseStatus: $rawResponseStatus, responseMessage: $responseMessage, user_id: $user_id, result: $result, dataResponse: $dataResponse, dataResponseKeyExtra: $dataResponseExtra}';
  }
}
