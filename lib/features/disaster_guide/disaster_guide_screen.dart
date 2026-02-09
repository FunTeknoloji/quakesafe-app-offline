import 'package:flutter/material.dart';

import '../../shared/components/app_card.dart';
import '../../shared/components/status_badge.dart';
import '../../shared/theme/app_tokens.dart';

class DisasterGuideScreen extends StatelessWidget {
  const DisasterGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        Text('Afet Rehberi', style: textTheme.headlineMedium),
        const SizedBox(height: AppSpacing.md),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Deprem Anında', style: textTheme.titleLarge),
              const SizedBox(height: AppSpacing.sm),
              const StatusBadge(label: 'Öncelik Yüksek', type: StatusBadgeType.caution),
              const SizedBox(height: AppSpacing.sm),
              Text('Çök-Kapan-Tutun pozisyonuna geçin ve camlardan uzak durun.', style: textTheme.bodyMedium),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        AppCard(
          child: Text(
            'Sarsıntı durduğunda acil çıkış planını takip edin, asansör kullanmayın ve toplanma alanına ilerleyin.',
            style: textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
