import 'package:flutter/material.dart';
import 'package:flutter_assignment/data/local/preference_manager.dart';
import 'package:flutter_assignment/data/local/preference_manager_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

// final databaseHelperProvider = Provider<PreferenceManager>((ref) {
//   return PreferenceManagerImpl.create();
// });

final sharedPreferencesProvider = Provider<PreferenceManager>((ref) {
  return PreferenceManagerImpl();
});

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.light; // Default value
});

final languageProvider = StateProvider<String>((ref) {
  return "en"; // Default value
});