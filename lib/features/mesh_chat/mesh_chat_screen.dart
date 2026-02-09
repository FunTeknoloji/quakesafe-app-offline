import 'package:flutter/material.dart';

import '../../shared/components/app_card.dart';
import '../../shared/components/empty_state_view.dart';
import '../../shared/theme/app_tokens.dart';

class MeshChatScreen extends StatelessWidget {
  const MeshChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mesh Sohbet', style: textTheme.headlineMedium),
          const SizedBox(height: AppSpacing.md),
          const AppCard(
            child: Row(
              children: [
                Icon(Icons.wifi_tethering, color: AppPalette.secondary),
                SizedBox(width: AppSpacing.sm),
                Expanded(child: Text('Bağlantı bekleniyor: Yakın cihaz bulunamadı')),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          const Expanded(
            child: EmptyStateView(
              title: 'Henüz mesaj yok',
              description: 'Cihazlar eşleştiğinde çevrimdışı mesajlaşma burada görünecek.',
              icon: Icons.chat_bubble_outline,
            ),
          ),
        ],
      ),
    );
  }
}
