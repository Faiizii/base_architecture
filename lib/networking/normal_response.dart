import 'package:base_architecture/networking/api_config.dart';
import 'package:base_architecture/networking/error_response.dart';

class NormalResponse {
  bool isError = false;
  ErrorResponse? errorResponse;
  dynamic data;
  NormalResponse();
  NormalResponse.fromErrorResponse(ErrorResponse this.errorResponse){
    isError = true;
  }
  String getErrorMessage () {
    assert(isError,"The response of the call is successful");

    return errorResponse?.message ?? "Unknown Error Occurred!";
  }
  int getErrorCode () {
    assert(isError,"The response of the call is successful");

    return errorResponse?.code ?? NetworkCodes.unknownErrorCode;
  }
}