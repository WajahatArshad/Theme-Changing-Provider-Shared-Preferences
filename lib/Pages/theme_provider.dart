import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  String currentTheme = 'system';
  ThemeMode get themeMode {
    if (currentTheme == 'system') {
      return ThemeMode.system;
    } else if (currentTheme == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  changeTheme(String theme) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('theme', theme);
    currentTheme = theme;
    notifyListeners();
  }

  initilize() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    currentTheme = pref.getString('theme') ?? 'system';
    notifyListeners();
  }
}
