import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  late SharedPreferences _sharedPreferences;

  Future<int?> getInt(String key) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.getInt(key);
  }

  Future<bool> setInt(String key, int value) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return await _sharedPreferences.setInt(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return await _sharedPreferences.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.getBool(key);
  }

  Future<bool> remove(String key) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return await _sharedPreferences.remove(key);
  }
}
