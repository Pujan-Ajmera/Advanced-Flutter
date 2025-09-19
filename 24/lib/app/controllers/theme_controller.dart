import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static const String THEME_KEY = 'isDarkMode';

  var isDarkMode = true.obs;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromPrefs();
  }

  void _loadThemeFromPrefs() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      isDarkMode.value =
          prefs.getBool(THEME_KEY) ?? true; // Default to dark mode
    } catch (e) {
      print('Error loading theme preference: $e');
      isDarkMode.value = true;
    }
  }

  void toggleTheme() async {
    try {
      isDarkMode.value = !isDarkMode.value;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(THEME_KEY, isDarkMode.value);

      // Update the app theme
      Get.changeTheme(
        isDarkMode.value
            ? ThemeController.darkTheme
            : ThemeController.lightTheme,
      );

      // Show feedback to user
      Get.snackbar(
        isDarkMode.value ? 'Dark Mode' : 'Light Mode',
        'Theme changed successfully',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: isDarkMode.value ? Colors.grey[800] : Colors.grey[300],
        colorText: isDarkMode.value ? Colors.white : Colors.black,
      );
    } catch (e) {
      print('Error saving theme preference: $e');
    }
  }

  ThemeData get currentTheme => isDarkMode.value ? darkTheme : lightTheme;

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF1A1B23),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF2B2D42),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF2A2B35),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFEF476F),
        secondary: Color(0xFF118AB2),
        surface: Color(0xFF2A2B35),
        background: Color(0xFF1A1B23),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Colors.white,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white70),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEF476F),
          foregroundColor: Colors.white,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFEF476F),
        foregroundColor: Colors.white,
      ),
    );
  }

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF2B2D42),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFFEF476F),
        secondary: Color(0xFF118AB2),
        surface: Colors.white,
        background: Color(0xFFF8F9FA),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Color(0xFF2B2D42),
        onBackground: Color(0xFF2B2D42),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Color(0xFF2B2D42),
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: Color(0xFF2B2D42),
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: Color(0xFF2B2D42),
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          color: Color(0xFF2B2D42),
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: Color(0xFF2B2D42),
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: Color(0xFF2B2D42),
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: Color(0xFF2B2D42),
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: Color(0xFF2B2D42),
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: Color(0xFF2B2D42),
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(color: Color(0xFF2B2D42)),
        bodyMedium: TextStyle(color: Color(0xFF2B2D42)),
        bodySmall: TextStyle(color: Color(0xFF6C757D)),
      ),
      iconTheme: const IconThemeData(color: Color(0xFF2B2D42)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEF476F),
          foregroundColor: Colors.white,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFEF476F),
        foregroundColor: Colors.white,
      ),
    );
  }
}
