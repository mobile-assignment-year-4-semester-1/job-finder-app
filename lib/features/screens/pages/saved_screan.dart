import 'package:flutter/material.dart';
import 'package:job_finder_app/features/utils/themes/light_mode.dart';

class SavedScrean extends StatelessWidget {
  const SavedScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CallColors.defaultColor,
      body: Center(
        child: Text(
          'Saved Your Favorite Job',
          style: TextStyle(color: Colors.green, fontSize: 28),
        ),
      ),
    );
  }
}
