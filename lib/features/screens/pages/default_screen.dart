import 'package:flutter/material.dart';
import 'package:job_finder_app/features/screens/pages/message_screen.dart';
import 'package:job_finder_app/features/screens/pages/saved_screan.dart';
import 'package:job_finder_app/features/screens/pages/notification.dart';
import 'package:job_finder_app/features/screens/pages/home_screen.dart';
import 'package:job_finder_app/features/services/databases/jobs_json.dart';

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({super.key});

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  int _selectedIndex = 0;

  final Future<List<Map<String, dynamic>>> _jobsFuture = Future.delayed(
    const Duration(milliseconds: 500),
    () => jobJsonData,
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Widget> screens = [
      FutureBuilder<List<Map<String, dynamic>>>(
        future: _jobsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return HomeScreen(jobs: snapshot.data ?? []);
          }
        },
      ),
      const MessageScreen(),
      const SavedScrean(),
      const NotificationScreen(),
    ];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: IndexedStack(index: _selectedIndex, children: screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: theme.bottomNavigationBarTheme.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              spreadRadius: 0.1,
              offset: const Offset(0, -1),
            ),
          ],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: BottomNavigationBar(
          backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
          currentIndex: _selectedIndex,
          selectedItemColor:
              theme.bottomNavigationBarTheme.selectedItemColor ??
              theme.colorScheme.primary,
          unselectedItemColor:
              theme.bottomNavigationBarTheme.unselectedItemColor ??
              theme.disabledColor,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              label: '',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
        ),
      ),
    );
  }
}
