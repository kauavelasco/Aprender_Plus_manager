import 'package:aprender_plus_manager/screens/home_screen.dart';
import 'package:flutter/material.dart';

class HomeMenus extends StatefulWidget {
  const HomeMenus({super.key});

  @override
  State<HomeMenus> createState() => _HomeMenusState();
}

class _HomeMenusState extends State<HomeMenus> {

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF101010),
        // ignore: deprecated_member_use
        unselectedItemColor: Color(0xFF101010).withOpacity(0.6),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
              size: 25,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fitness_center,
              size: 25,
            ),
            label: 'Exercícios',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article,
              size: 25,
            ),
            label: 'Artigos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 25,
            ),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}