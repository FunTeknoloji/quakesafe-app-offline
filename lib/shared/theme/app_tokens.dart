import 'package:flutter/material.dart';

@immutable
final class AppPalette {
  const AppPalette._();

  static const Color background = Color(0xFF0B0814);
  static const Color surface = Color(0xFF161125);
  static const Color surfaceHigh = Color(0xFF221A35);
  static const Color border = Color(0xFF3B2D5B);

  static const Color primary = Color(0xFF7C4DFF);
  static const Color primaryStrong = Color(0xFF986CFF);
  static const Color secondary = Color(0xFF4EC5F1);

  static const Color success = Color(0xFF47D16A);
  static const Color warning = Color(0xFFFFB74D);
  static const Color danger = Color(0xFFFF6B6B);

  static const Color textPrimary = Color(0xFFF4EEFF);
  static const Color textSecondary = Color(0xFFC0B5DC);
  static const Color textMuted = Color(0xFF8D80AE);
  static const Color onPrimary = Color(0xFFFFFFFF);
}

@immutable
final class AppSpacing {
  const AppSpacing._();

  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}

@immutable
final class AppRadius {
  const AppRadius._();

  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double pill = 999;
}

@immutable
final class AppElevation {
  const AppElevation._();

  static const double low = 1;
  static const double medium = 3;
  static const double high = 8;
}

@immutable
final class AppTypography {
  const AppTypography._();

  static TextTheme textTheme() {
    return const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28,
        height: 1.2,
        fontWeight: FontWeight.w700,
        color: AppPalette.textPrimary,
      ),
      headlineMedium: TextStyle(
        fontSize: 22,
        height: 1.3,
        fontWeight: FontWeight.w700,
        color: AppPalette.textPrimary,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        height: 1.3,
        fontWeight: FontWeight.w600,
        color: AppPalette.textPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        height: 1.35,
        fontWeight: FontWeight.w600,
        color: AppPalette.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 1.5,
        fontWeight: FontWeight.w400,
        color: AppPalette.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        height: 1.45,
        fontWeight: FontWeight.w400,
        color: AppPalette.textSecondary,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        height: 1.3,
        fontWeight: FontWeight.w600,
        color: AppPalette.textPrimary,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        height: 1.3,
        fontWeight: FontWeight.w600,
        color: AppPalette.textSecondary,
      ),
    );
  }
}
