import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool?>(
  (ref) => DarkModeNotifier(),
);

class DarkModeNotifier extends StateNotifier<bool?> {
  DarkModeNotifier() : super(false) {
    _initializeDarkMode();
  }

  Future<void> _initializeDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    final darkMode = prefs.getBool('isDarkMode');
    state = darkMode;
  }

  Future<void> toggleDarkMode(bool newDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', newDarkMode);
    state = newDarkMode;
  }
}
