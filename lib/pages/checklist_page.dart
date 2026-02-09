import 'package:flutter/material.dart';

import '../widgets/section_card.dart';

class ChecklistPage extends StatefulWidget {
  const ChecklistPage({super.key});

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  final Map<String, bool> items = {
    'Su (en az 72 saatlik)': false,
    'İlk yardım çantası': false,
    'El feneri ve pil': false,
    'Powerbank': false,
    'Önemli belgelerin kopyası': false,
    'Toplanma planı': false,
  };

  @override
  Widget build(BuildContext context) {
    final doneCount = items.values.where((v) => v).length;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SectionCard(
          title: 'Hazırlık Durumu',
          child: LinearProgressIndicator(
            value: items.isEmpty ? 0 : doneCount / items.length,
            minHeight: 10,
            borderRadius: BorderRadius.circular(8),
          ),
          action: Text('$doneCount/${items.length}'),
        ),
        const SizedBox(height: 12),
        SectionCard(
          title: 'Çanta Kontrol Listesi',
          child: Column(
            children: items.keys
                .map(
                  (k) => CheckboxListTile(
                    value: items[k],
                    contentPadding: EdgeInsets.zero,
                    title: Text(k),
                    onChanged: (value) {
                      setState(() {
                        items[k] = value ?? false;
                      });
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
