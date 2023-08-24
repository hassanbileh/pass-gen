import 'package:flutter/material.dart';
import 'package:passgen/screens/screens.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const GeneratorScreen(),
    Scaffold(),
  ];
  final Map<String, IconData> _icons = {
    'Home': Icons.home_filled,
    'Generator': Icons.build_circle,
    'Profil': Icons.account_circle,
  };

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: _icons
            .map(
              (title, icon) => MapEntry(
                title,
                BottomNavigationBarItem(
                  icon: Icon(
                    icon,
                    size: 30.0,
                  ),
                  label: title,
                ),
              ),
            )
            .values
            .toList(),
        currentIndex: _currentIndex,
        selectedFontSize: 11.0,
        selectedItemColor: Colors.red.shade600,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
      ),
    );
  }
}
