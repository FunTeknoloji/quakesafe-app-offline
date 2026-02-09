import 'package:flutter/material.dart';

import 'features/checklist/checklist_screen.dart';
import 'features/disaster_guide/disaster_guide_screen.dart';
import 'features/home/home_screen.dart';
import 'features/mesh_chat/mesh_chat_screen.dart';
import 'features/settings/settings_screen.dart';
import 'shared/components/app_bottom_nav.dart';
import 'shared/theme/app_theme.dart';

class QuakeSafeApp extends StatelessWidget {
  const QuakeSafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      home: const _RootScaffold(),
    );
  }
}

class _RootScaffold extends StatefulWidget {
  const _RootScaffold();

  @override
  State<_RootScaffold> createState() => _RootScaffoldState();
}

class _RootScaffoldState extends State<_RootScaffold> {
  int _index = 0;

  static const _screens = [
    HomeScreen(),
    DisasterGuideScreen(),
    ChecklistScreen(),
    MeshChatScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _screens[_index]),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _index,
        onTap: (value) => setState(() => _index = value),
      ),
    );
  }
}
