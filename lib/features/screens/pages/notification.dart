import 'package:flutter/material.dart';
import 'package:job_finder_app/features/screens/pages/default_screen.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';
import 'package:job_finder_app/features/utils/themes/light_mode.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            const Text(
              "New activity",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _notificationItem(
              "assets/fiverr.png",
              "Fiverr",
              "want to take a final interview of you where head of HR will see you!",
              "12 min ago",
              true,
            ),
            _notificationItem(
              "assets/macdonald.png",
              "Macdonald",
              "want to contact with you in 24 hours with proper preparation",
              "47 min ago",
              true,
            ),
            const SizedBox(height: 20),
            _sectionHeader("Applications"),
            _notificationItem(
              "assets/bmw.png",
              "BMW",
              "Your application is submitted successfully to BMW. You can check the status here.",
              "1 hrs ago",
              false,
            ),
            _notificationItem(
              "assets/booking.png",
              "Booking.com",
              "reviewing your application, cover letter and portfolio. All the best!",
              "3 hrs ago",
              false,
            ),
            const SizedBox(height: 20),
            _sectionHeader("Interview"),
            _notificationItem(
              "assets/beats.png",
              "Beats",
              "liked your resume and want to take an interview of you.",
              "4 hrs ago",
              false,
            ),
            _notificationItem(
              "assets/behance.png",
              "Behance",
              "You passed the first round. Be prepared for the next!",
              "6 hrs ago",
              false,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const Text("See all", style: TextStyle(color: Colors.green)),
      ],
    );
  }

  Widget _notificationItem(
    String imagePath,
    String title,
    String subtitle,
    String time,
    bool showDot,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 22,
            backgroundColor: Colors.grey[200],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: "$title ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: subtitle,
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              Text(
                time,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              if (showDot)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
