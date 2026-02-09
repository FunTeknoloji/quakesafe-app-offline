import 'package:flutter/material.dart';

import 'pages/chat_page.dart';
import 'pages/checklist_page.dart';
import 'pages/guides_page.dart';
import 'pages/home_page.dart';
import 'pages/settings_page.dart';

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
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0F0D18)),
        useMaterial3: true,
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int index = 0;

  static const titles = [
    'QuakeSafe',
    'Rehber',
    'Kontrol Listesi',
    'Mesh Sohbet',
    'Ayarlar',
  ];

  final pages = const [
    HomePage(),
    GuidesPage(),
    ChecklistPage(),
    ChatPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[index])),
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Ana Sayfa'),
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), label: 'Rehber'),
          NavigationDestination(icon: Icon(Icons.checklist_outlined), label: 'Liste'),
          NavigationDestination(icon: Icon(Icons.forum_outlined), label: 'Sohbet'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Ayarlar'),
        ],
      ),
    );
  }
}
