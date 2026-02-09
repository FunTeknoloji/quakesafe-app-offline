import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Ana Ekran',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_outlined),
          activeIcon: Icon(Icons.menu_book),
          label: 'Rehber',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.checklist_outlined),
          activeIcon: Icon(Icons.checklist),
          label: 'Kontrol',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.hub_outlined),
          activeIcon: Icon(Icons.hub),
          label: 'Mesh',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          activeIcon: Icon(Icons.settings),
          label: 'Ayarlar',
        ),
      ],
    );
  }
}
