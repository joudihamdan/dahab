import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  final name = 'joudi Hamdan'.obs;
  final selectedLanguage = 'ar'.obs;
  final isDarkMode = false.obs;

  // String get name => _name.value;
  // String get selectedLanguage => _selectedLanguage.value;
  // bool get isDarkMode => _isDarkMode.value;

  void changeLanguage(String? value) {
    if (value != null) {
      selectedLanguage.value = value;
    }
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    print(isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void rate() {
  }

  void logout() {
  }
}