import 'package:flutter/material.dart';

import '../theme/app_tokens.dart';

class EmergencyButton extends StatelessWidget {
  const EmergencyButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.emergency_outlined),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPalette.danger,
        foregroundColor: AppPalette.onPrimary,
        disabledBackgroundColor: AppPalette.surfaceHigh,
        disabledForegroundColor: AppPalette.textMuted,
      ),
    );
  }
}
