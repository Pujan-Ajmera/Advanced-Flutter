import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Obx(
      () => IconButton(
        icon: Icon(
          themeController.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
          color: Colors.white,
        ),
        onPressed: () => themeController.toggleTheme(),
        tooltip:
            themeController.isDarkMode.value
                ? 'Switch to Light Mode'
                : 'Switch to Dark Mode',
      ),
    );
  }
}
