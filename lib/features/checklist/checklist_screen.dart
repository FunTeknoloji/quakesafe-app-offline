import 'package:flutter/material.dart';

import '../../shared/components/app_card.dart';
import '../../shared/theme/app_tokens.dart';

class ChecklistScreen extends StatelessWidget {
  const ChecklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        Text('Kontrol Listesi', style: textTheme.headlineMedium),
        const SizedBox(height: AppSpacing.md),
        AppCard(
          child: Column(
            children: const [
              _ChecklistItem(title: 'İlk yardım çantası hazır', completed: true),
              Divider(height: AppSpacing.lg),
              _ChecklistItem(title: 'Su ve kuru gıda stoğu', completed: true),
              Divider(height: AppSpacing.lg),
              _ChecklistItem(title: 'Aile iletişim planı', completed: false),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChecklistItem extends StatelessWidget {
  const _ChecklistItem({required this.title, required this.completed});

  final String title;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(
          completed ? Icons.check_circle : Icons.radio_button_unchecked,
          color: completed ? AppPalette.success : AppPalette.textMuted,
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(title, style: textTheme.bodyLarge),
        ),
      ],
    );
  }
}
