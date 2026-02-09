import 'package:flutter/material.dart';

import '../data/offline_data.dart';
import '../widgets/section_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SectionCard(
          title: 'Durum Özeti',
          child: Row(
            children: [
              Expanded(
                child: _MetricBox(
                  label: 'Offline Rehber',
                  value: '${OfflineData.duringQuake.length + OfflineData.afterQuake.length} adım',
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: _MetricBox(label: 'Mesh Sohbet', value: 'Hazır (Demo)'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SectionCard(
          title: 'Acil Arama Numaraları',
          child: Column(
            children: OfflineData.contacts
                .map(
                  (c) => ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(c.name),
                    subtitle: Text(c.description),
                    trailing: Text(
                      c.phone,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _MetricBox extends StatelessWidget {
  const _MetricBox({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surface,
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 4),
          Text(value, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
