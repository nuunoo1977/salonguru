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

  static final overlayButton = ButtonStyle(
    padding: WidgetStateProperty.all(EdgeInsets.all(4)),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    backgroundColor: WidgetStateProperty.all(Colors.black.withValues(alpha: 0.6)),
  );
}
