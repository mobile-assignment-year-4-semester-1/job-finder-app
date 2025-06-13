import 'package:flutter/material.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';
import 'package:job_finder_app/features/screens/pages/home_screen.dart';

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({super.key});

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture App',
      initialRoute: '/',
      routes: {
      },
      home: Scaffold(
        backgroundColor: AppColors.background,
        body: _screens[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppColors.bottomBarBackground,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 3,
                spreadRadius: 0.1,
                offset: const Offset(0, -1), // Moves shadow upward
              ),
            ],
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: BottomNavigationBar(
              backgroundColor: AppColors.bottomBarBackground,
              type: BottomNavigationBarType.fixed,
              elevation: 0, // Use custom shadow instead
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 28), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border, size: 28),
                    label: 'Favor'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.qr_code_scanner, size: 30), label: 'Scan'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person, size: 28), label: 'Profile'),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: AppColors.iconBottom,
              unselectedItemColor: Colors.grey,
              selectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.normal),
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}