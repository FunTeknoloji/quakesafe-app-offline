import 'package:flutter/material.dart';

import '../../shared/components/app_card.dart';
import '../../shared/theme/app_tokens.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        Text('Ayarlar', style: textTheme.headlineMedium),
        const SizedBox(height: AppSpacing.md),
        const AppCard(
          child: Column(
            children: [
              _SettingsTile(
                icon: Icons.language,
                title: 'Dil',
                value: 'Türkçe',
              ),
              Divider(height: AppSpacing.lg),
              _SettingsTile(
                icon: Icons.notifications_active_outlined,
                title: 'Acil Bildirim',
                value: 'Açık',
              ),
              Divider(height: AppSpacing.lg),
              _SettingsTile(
                icon: Icons.security_outlined,
                title: 'Gizlilik',
                value: 'Yerel depolama',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppPalette.primaryStrong),
        const SizedBox(width: AppSpacing.sm),
        Expanded(child: Text(title)),
        Text(value, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
