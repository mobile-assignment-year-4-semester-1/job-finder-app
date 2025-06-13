import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Notification Page',
          style: TextStyle(color: Colors.green, fontSize: 28),
        ),
      ),
    );
  }
}
