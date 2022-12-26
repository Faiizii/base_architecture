import 'package:base_architecture/dart_core/enums/network_enums.dart';
import 'package:base_architecture/networking/api_config.dart';

class NetworkingManager {
  static final NetworkingManager _instance = NetworkingManager._();
  NetworkingManager._();
  factory NetworkingManager() => _instance;
  final ApiConfig _apiConfig = ApiConfig();
  Future<dynamic> callApi({
    required CallType callType,
    required String url,
    dynamic params = const {},
    NetworkContentType contentType = NetworkContentType.json,
    bool isLoading = true,
  }) async {
    //check for internet first
    if(callType == CallType.get){
      return await _apiConfig.callGetApi(url: url,queryParams: params,contentType: contentType);
    }else if(callType == CallType.post){
      return await _apiConfig.callPostApi(url: url,params: params,contentType: contentType);
    }else{
      //call rest
      throw Exception("Unimplemented request $callType");
    }
  }
}