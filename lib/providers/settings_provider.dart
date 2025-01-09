import 'package:flutter_assignment/data/local/preference_manager.dart';
import 'package:flutter_assignment/providers/misc_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsProvider = Provider<AppSettings>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return AppSettings(prefs);
});

class AppSettings {
  final PreferenceManager _prefs;

  AppSettings(this._prefs);

  Future<bool> isDarkMode() async {
    return await _prefs.getBool('is_dark_mode');
  }

  Future<void> setDarkMode(bool value) async {
    await _prefs.setBool('is_dark_mode', value);
  }

  Future<String> getLanguage() async {
    return await _prefs.getString('language', defaultValue: 'en');
  }

  void setLanguage(String language) async {
    await _prefs.setString('language', language);
  }
}
