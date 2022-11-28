import 'package:flutter/cupertino.dart';
import 'package:resum_app_project/Shared%20Preferences/shared_preferences.dart';

class LangProviders extends ChangeNotifier {
  String lang_ = SharedPreferencesController().getLanguage;

  Future<void> changeLanguage() async {
    lang_ == 'ar' ? lang_ = 'en' : lang_ = 'ar';

    await SharedPreferencesController().setLanguage(lang_);
    notifyListeners();
  }
}
