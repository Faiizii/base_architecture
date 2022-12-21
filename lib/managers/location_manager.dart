import 'dart:async';
import 'dart:io';
import 'package:geolocator/geolocator.dart';

class LocationManager {
  static final LocationManager _instance = LocationManager._();
  LocationManager._();
  factory LocationManager() => _instance;

  Future<bool> checkLocationPermissions() async {

    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if(isServiceEnabled){
      LocationPermission permission = await Geolocator.requestPermission();
      return permission == LocationPermission.whileInUse || permission == LocationPermission.always;
    }
    return false;
  }

  Future<Position> get currentPosition async => await Geolocator.getCurrentPosition();
  Future<Position?> get recentLocation async => await Geolocator.getLastKnownPosition();

  Stream<Position> getPositionStream() {
    late LocationSettings settings;
    if(Platform.isAndroid){
      settings = AndroidSettings();
    }else if(Platform.isIOS){
      settings = AppleSettings();
    }else{
      settings = const LocationSettings();
    }

    return Geolocator.getPositionStream(locationSettings: settings);
  }

}