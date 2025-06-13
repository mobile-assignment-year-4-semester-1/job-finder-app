import 'package:flutter/material.dart';

class SavedScrean extends StatelessWidget {
  const SavedScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Saved Your Favorite Job',
          style: TextStyle(color: Colors.green, fontSize: 28),
        ),
      ),
    );
  }
}
