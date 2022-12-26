import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:base_architecture/networking/api_config.dart';
import 'package:base_architecture/networking/error_response.dart';
import 'package:base_architecture/networking/normal_response.dart';
import 'package:http/http.dart' as http;

class ApiResponseHandler {
  static Future<NormalResponse> parseSuccessResponse(http.Response? response) async {
    NormalResponse normalResponse = NormalResponse();
    if(response == null){
      ErrorResponse errorResponse = ErrorResponse(
          NetworkCodes.unknownErrorCode,
          "An unknown error occurred while communicating with the server"
      );
      return NormalResponse.fromErrorResponse(errorResponse);
    }
    if(response.statusCode == NetworkCodes.success){
      normalResponse.data = response.body;
      return normalResponse;
    }else{
      Map<String, dynamic> json = jsonDecode(response.body);
      if(json['statusCode'] == NetworkCodes.unauthorized){
        return NormalResponse.fromErrorResponse(ErrorResponse(
          NetworkCodes.unauthorized,
          "unauthorized access...!"
        ));
      }else{
        return NormalResponse.fromErrorResponse(ErrorResponse(
            NetworkCodes.unknownErrorCode,
            "An unknown error occurred while communicating with the server"
        ));
      }
    }
  }

  static Future<NormalResponse> parseErrorResponse(e) async {
    //extend this method for handle more exceptions
    NormalResponse response = NormalResponse();
    response.isError = true;
    if(e is SocketException) {
      response.errorResponse = ErrorResponse(NetworkCodes.errorCode, "Unable to connect to server. Please check your internet connection");
    } else if(e is TimeoutException) {
      response.errorResponse = ErrorResponse(NetworkCodes.errorCode, "Slow Internet Connection. Please check your internet connection");
    } else if(e is FormatException) {
      response.errorResponse = ErrorResponse(NetworkCodes.errorCode, "Invalid path provided for the request. Please contact support if continuously facing this issue.");
    } else if(e is NoSuchMethodError ) {
      response.errorResponse = ErrorResponse(NetworkCodes.errorCode, "Invalid Response received from server");
    }else{
      response.errorResponse = ErrorResponse(NetworkCodes.errorCode, e.toString());
    }
    return response;
  }
}