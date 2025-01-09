import 'package:flutter/material.dart';
import 'package:flutter_assignment/providers/settings_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  final AppSettings _appSettings;

  ThemeNotifier(this._appSettings) : super(ThemeMode.light) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final isDarkMode = await _appSettings.isDarkMode();
    state = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme() async {
    final isDarkMode = state == ThemeMode.dark;
    await _appSettings.setDarkMode(!isDarkMode);
    state = !isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
}

final themeNotifierProvider =
StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  final appSettings = ref.watch(settingsProvider);
  return ThemeNotifier(appSettings);
});
