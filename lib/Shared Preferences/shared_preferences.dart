import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
  static late SharedPreferences _sharedPreferences;
  static sharedPreferencesInitialized() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?>? setData({required String key, dynamic value}) async {
    if (value is int) {
      await _sharedPreferences.setInt(key, value);
      return true;
    } else if (value is String) {
      await _sharedPreferences.setString(key, value);
      return true;
    } else if (value is double) {
      await _sharedPreferences.setDouble(key, value);
      return true;
    } else if (value is bool) {
      await _sharedPreferences.setBool(key, value);
      return true;
    }
    return false;
  }

  static deleteItem({required String key}) {
    _sharedPreferences.remove(key);
  }

  static clearAllData({required String key}) {
    _sharedPreferences.clear();
  }

  static dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }
}
