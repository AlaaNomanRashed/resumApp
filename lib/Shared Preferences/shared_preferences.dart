import 'package:shared_preferences/shared_preferences.dart';

enum SpKeys { lang, theme }

class SharedPreferencesController {
  static final SharedPreferencesController _sharedPrefControllerObj =
      SharedPreferencesController._sharedPrefPrivateConstructor();

  SharedPreferencesController._sharedPrefPrivateConstructor();

  late SharedPreferences _sharedPrefLibObj;

  factory SharedPreferencesController() {
    return _sharedPrefControllerObj;
  }

  Future<void> initSharedPreferences() async {
    _sharedPrefLibObj = await SharedPreferences.getInstance();
  }

  /// Language
  Future<void> setLanguage(String language) async {
    await _sharedPrefLibObj.setString(SpKeys.lang.name, language);
  }

  String get getLanguage =>
      _sharedPrefLibObj.getString(SpKeys.lang.name) ?? 'en';

  /// Theme
  Future<void> setTheme(String theme) async {
    await _sharedPrefLibObj.setString(SpKeys.theme.name, theme);
  }
  String get getTheme =>
      _sharedPrefLibObj.getString(SpKeys.theme.name) ?? 'isDark';
}
