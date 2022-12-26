import 'dart:convert';

import 'package:base_architecture/dart_core/enums/network_enums.dart';
import 'package:base_architecture/dart_core/extensions/enum_extension.dart';
import 'package:base_architecture/networking/api_response_handler.dart';
import 'package:http/http.dart' as http;

class NetworkCodes {
  static const errorCode = -1;
  static const unknownErrorCode = -2;
  static const success = 200;
  static const unauthorized = 401;
}

class ApiConfig {
  final _baseUrl = "";
  Future<dynamic> callGetApi({
    required String url,
    dynamic queryParams = const {},
    NetworkContentType contentType = NetworkContentType.json
}) async {
    Map<String,String> headers = {
      'Content-Type' : contentType.typeValue
    };
    //convert the query parameters for get request
    String str = '';
    if (queryParams != null && queryParams.isNotEmpty) {
      queryParams.forEach((key, value) {
        if (str.isEmpty) {
          str = '$str$key=$value';
        } else {
          str = '$str&$key=$value';
        }
      });
    }
    if (str.isNotEmpty) {
      url = '$url?$str';
    }

    Uri uri = Uri.parse('$_baseUrl/$url');
    http.Response? response;
    try{
      response = await http.get(uri,headers: headers).timeout(const Duration(seconds: 45));
      return await ApiResponseHandler.parseSuccessResponse(response);
    }catch (e){
      return await ApiResponseHandler.parseErrorResponse(e);
    }
  }
  Future<dynamic> callPostApi({
    required String url,
    dynamic params = const {},
    NetworkContentType contentType = NetworkContentType.json
}) async {
    if(contentType == NetworkContentType.json){
      params = jsonEncode(params);
    }
    Map<String,String> headers = {
      'Content-Type' : contentType.typeValue
    };
    Uri uri = Uri.parse('$_baseUrl/$url');
    http.Response? response;
    try{
      response = await http.post(uri,headers: headers,body: params).timeout(const Duration(seconds: 45));
      return await ApiResponseHandler.parseSuccessResponse(response);
    }catch (e){
      return await ApiResponseHandler.parseErrorResponse(e);
    }
  }
}