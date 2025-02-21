import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_textstyles.dart';

class AppTheme {
  static final appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    useMaterial3: true,
    primaryColor: AppColors.primary,
    badgeTheme: BadgeThemeData(
      textStyle: AppTextstyles.cartBadge,
    ),
  );
}
