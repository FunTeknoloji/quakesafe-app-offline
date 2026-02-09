import 'package:flutter/material.dart';

import 'app_tokens.dart';

@immutable
final class AppTheme {
  const AppTheme._();

  static ThemeData dark() {
    const colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppPalette.primary,
      onPrimary: AppPalette.onPrimary,
      secondary: AppPalette.secondary,
      onSecondary: AppPalette.background,
      error: AppPalette.danger,
      onError: AppPalette.background,
      surface: AppPalette.surface,
      onSurface: AppPalette.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppPalette.background,
      colorScheme: colorScheme,
      textTheme: AppTypography.textTheme(),
      dividerColor: AppPalette.border,
      cardTheme: const CardThemeData(
        color: AppPalette.surface,
        elevation: AppElevation.low,
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPalette.primary,
          foregroundColor: AppPalette.onPrimary,
          disabledBackgroundColor: AppPalette.surfaceHigh,
          disabledForegroundColor: AppPalette.textMuted,
          minimumSize: const Size.fromHeight(52),
          elevation: AppElevation.medium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          textStyle: AppTypography.textTheme().labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppPalette.border),
          foregroundColor: AppPalette.textPrimary,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppPalette.surfaceHigh,
        disabledColor: AppPalette.surface,
        selectedColor: AppPalette.primary,
        secondarySelectedColor: AppPalette.primaryStrong,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        side: const BorderSide(color: AppPalette.border),
        labelStyle: AppTypography.textTheme().labelMedium,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppPalette.background,
        foregroundColor: AppPalette.textPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppPalette.surface,
        selectedItemColor: AppPalette.primaryStrong,
        unselectedItemColor: AppPalette.textMuted,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
