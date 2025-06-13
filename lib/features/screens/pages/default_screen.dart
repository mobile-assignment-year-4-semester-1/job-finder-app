import 'package:flutter/material.dart';
import 'package:job_finder_app/features/screens/pages/message_screen.dart';
import 'package:job_finder_app/features/screens/pages/saved_screan.dart';
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
    MessageScreen(),
    SavedScrean(),
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
      title: 'Discover Jobs',
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
            child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(
                icon: Icon(Icons.message), label: ''),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border), label: ''),
              BottomNavigationBarItem(
                icon: Icon(Icons.person), label: ''),
            ],
            ),
          ),
        ),
    );
  }
}