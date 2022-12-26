import 'package:base_architecture/dart_core/enums/network_enums.dart';

extension NetworkCTExtension on NetworkContentType {
  String get typeValue {
    switch(this){
      case NetworkContentType.json: return "json";
    }
    return "other";
  }
}