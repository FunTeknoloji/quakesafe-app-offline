import 'package:flutter/material.dart';

import '../data/offline_data.dart';
import '../widgets/section_card.dart';

class GuidesPage extends StatelessWidget {
  const GuidesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SectionCard(
          title: 'Deprem Anında',
          child: Column(
            children: OfflineData.duringQuake
                .map((s) => _StepTile(title: s.title, description: s.description))
                .toList(),
          ),
        ),
        const SizedBox(height: 12),
        SectionCard(
          title: 'Deprem Sonrasında',
          child: Column(
            children: OfflineData.afterQuake
                .map((s) => _StepTile(title: s.title, description: s.description))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _StepTile extends StatelessWidget {
  const _StepTile({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.check_circle_outline),
      title: Text(title),
      subtitle: Text(description),
    );
  }
}
