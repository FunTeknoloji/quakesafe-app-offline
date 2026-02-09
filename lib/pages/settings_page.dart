import 'package:flutter/material.dart';

import '../widgets/section_card.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool highContrast = false;
  bool vibrationAlert = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SectionCard(
          title: 'Bildirim ve Erişilebilirlik',
          child: Column(
            children: [
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                value: vibrationAlert,
                title: const Text('Titreşimli acil uyarı'),
                onChanged: (v) => setState(() => vibrationAlert = v),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                value: highContrast,
                title: const Text('Yüksek kontrast'),
                onChanged: (v) => setState(() => highContrast = v),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const SectionCard(
          title: 'Uygulama Bilgisi',
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('QuakeSafe v1.0.0'),
            subtitle: Text('Offline odaklı deprem bilgilendirme uygulaması.'),
          ),
        ),
      ],
    );
  }
}
