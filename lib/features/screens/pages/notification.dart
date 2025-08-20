import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Text(
              "New activity",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _notificationItem(
              context,
              "assets/fiverr.png",
              "Fiverr",
              "want to take a final interview of you where head of HR will see you!",
              "12 min ago",
              true,
            ),
            _notificationItem(
              context,
              "assets/macdonald.png",
              "Macdonald",
              "want to contact with you in 24 hours with proper preparation",
              "47 min ago",
              true,
            ),
            const SizedBox(height: 20),
            _sectionHeader(context, "Applications"),
            _notificationItem(
              context,
              "assets/bmw.png",
              "BMW",
              "Your application is submitted successfully to BMW. You can check the status here.",
              "1 hrs ago",
              false,
            ),
            _notificationItem(
              context,
              "assets/booking.png",
              "Booking.com",
              "reviewing your application, cover letter and portfolio. All the best!",
              "3 hrs ago",
              false,
            ),
            const SizedBox(height: 20),
            _sectionHeader(context, "Interview"),
            _notificationItem(
              context,
              "assets/beats.png",
              "Beats",
              "liked your resume and want to take an interview of you.",
              "4 hrs ago",
              false,
            ),
            _notificationItem(
              context,
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

  Widget _sectionHeader(BuildContext context, String title) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "See all",
          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.green),
        ),
      ],
    );
  }

  Widget _notificationItem(
    BuildContext context,
    String imagePath,
    String title,
    String subtitle,
    String time,
    bool showDot,
  ) {
    final theme = Theme.of(context);

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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onBackground,
                ),
                children: [
                  TextSpan(
                    text: subtitle,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: theme.colorScheme.onBackground,
                    ),
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
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              if (showDot)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
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
