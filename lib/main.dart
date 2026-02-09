import 'package:flutter/material.dart';

void main() {
  runApp(const QuakeSafeApp());
}

class QuakeSafeApp extends StatelessWidget {
  const QuakeSafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    const darkPurple = Color(0xFF5B21B6);

    return MaterialApp(
      title: 'QuakeSafe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0A10),
        colorScheme: const ColorScheme.dark(
          primary: darkPurple,
          secondary: Color(0xFF8B5CF6),
          surface: Color(0xFF151320),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuakeSafe'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _InfoCard(
            title: 'Acil Durum Bilgilendirme',
            subtitle: 'Deprem anında güvenli davranış adımlarını internet olmadan görüntüleyin.',
          ),
          SizedBox(height: 12),
          _InfoCard(
            title: 'Offline Hazırlık Listesi',
            subtitle: 'Su, ilk yardım kiti ve toplanma planı için kontrol listesini takip edin.',
          ),
          SizedBox(height: 12),
          _InfoCard(
            title: 'Mesh Sohbet (Yakında)',
            subtitle: 'Bluetooth mesh tabanlı acil iletişim altyapısı için temel hazır.',
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
