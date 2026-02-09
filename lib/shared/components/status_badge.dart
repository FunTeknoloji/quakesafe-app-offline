import 'package:flutter/material.dart';

import '../theme/app_tokens.dart';

enum StatusBadgeType { safe, caution, danger }

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.label,
    required this.type,
  });

  final String label;
  final StatusBadgeType type;

  @override
  Widget build(BuildContext context) {
    final (background, foreground) = switch (type) {
      StatusBadgeType.safe => (AppPalette.success.withOpacity(0.2), AppPalette.success),
      StatusBadgeType.caution => (AppPalette.warning.withOpacity(0.2), AppPalette.warning),
      StatusBadgeType.danger => (AppPalette.danger.withOpacity(0.2), AppPalette.danger),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: foreground),
      ),
    );
  }
}
