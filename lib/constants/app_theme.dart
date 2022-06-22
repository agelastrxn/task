import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_sizes.dart';

class AppTheme {
  late ThemeData theme;
  AppTheme() {
    theme = ThemeData.dark().copyWith(
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.black,
      ),
      textTheme: const TextTheme(
          headline1: TextStyle(fontSize: AppSizes.titleFontSize)),
      appBarTheme: const AppBarTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(AppSizes.appBarRadius)),
        ),
      ),
      tabBarTheme: const TabBarTheme(
          labelColor: AppColors.black,
          unselectedLabelColor: AppColors.secondaryColor),
    );
  }
}
