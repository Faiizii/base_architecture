import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  //singleton pattern
  static final PreferenceManager _instance = PreferenceManager._();
  PreferenceManager._();
  factory PreferenceManager() => _instance;

  SharedPreferences? _pf;
  Future<void> initialize() async {
    _pf = await SharedPreferences.getInstance();
  }

  final _storeKey = "this_is_key";

  void testStore(String val){
    _storeString(_storeKey, val);
  }
  String getTestValue(){
    return _readString(_storeKey);
  }
  void _storeString(String key,String val){
    assert (_pf != null,"make sure you have called initialize() method before accessing the shared preferences");
    _pf?.setString(key, val);
  }

  String _readString(String key){
    assert (_pf != null,"make sure you have called initialize() method before accessing the shared preferences");
    String? temp = _pf?.getString(key);
    assert (temp != null,"the value your are trying to read is not present");
    return temp!;
  }
}