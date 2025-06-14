import 'package:flutter/material.dart';
import 'package:job_finder_app/features/utils/themes/light_mode.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CallColors.defaultColor,
      body: Center(
        child: Text(
          'Notification Page',
          style: TextStyle(color: Colors.green, fontSize: 28),
        ),
      ),
    );
  }
}
