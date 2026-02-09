import 'package:flutter/material.dart';

import '../../shared/components/app_card.dart';
import '../../shared/components/emergency_button.dart';
import '../../shared/components/status_badge.dart';
import '../../shared/theme/app_tokens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        Text('QuakeSafe', style: textTheme.headlineLarge),
        const SizedBox(height: AppSpacing.xs),
        Text('Çevrimdışı afet hazırlık merkezi', style: textTheme.bodyMedium),
        const SizedBox(height: AppSpacing.lg),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bölge Durumu', style: textTheme.titleLarge),
              const SizedBox(height: AppSpacing.sm),
              const StatusBadge(label: 'Düşük Risk', type: StatusBadgeType.safe),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Sarsıntı sonrası toplanma noktaları ve iletişim ağı aktif.',
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        const EmergencyButton(label: 'Acil Yardım Protokolünü Başlat', onPressed: null),
      ],
    );
  }
}
