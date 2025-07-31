import 'package:flutter/material.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';
import 'package:job_finder_app/features/utils/themes/light_mode.dart';
import 'package:job_finder_app/features/utils/themes/light_mode.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.green),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search a chat or message',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Companies",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _chatItem(
              "Google",
              "Are you available for an interview?",
              "11:45 am",
              "assets/google.png",
              4,
            ),
            _chatItem(
              "HP",
              "We are looking forward to takin...",
              "11:45 am",
              "assets/hp.png",
              1,
            ),
            _chatItem(
              "Spotify",
              "Are you available for an interview",
              "11:45 am",
              "assets/spotify.png",
              0,
            ),
            const SizedBox(height: 20),
            const Text(
              "Individual Messages",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _chatItem(
              "Rith Adric",
              "We are looking for a web develo...",
              "11:45 am",
              "assets/erik.png",
              7,
            ),
            _chatItem(
              "Pich Chimi",
              "I checked your portfolio. It looks...",
              "11:45 am",
              "assets/nicolas.png",
              2,
            ),
            _chatItem(
              "Tak Vanneth",
              "Are you available for an interview",
              "11:45 am",
              "assets/jessica.png",
              0,
            ),
            _chatItem(
              "Aum Lily",
              "Are you available for an interview",
              "11:45 am",
              "assets/rowling.png",
              0,
            ),
          ],
        ),
      ),
      backgroundColor: CallColors.defaultColor,
      body: Center(
        child: Text(
          'Message Page',
          style: TextStyle(color: Colors.green, fontSize: 28),
        ),
      ),
    );
  }

  Widget _chatItem(
    String name,
    String message,
    String time,
    String imagePath,
    int unreadCount,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: AssetImage(imagePath), radius: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(
                  message,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(time, style: const TextStyle(fontSize: 12)),
              const SizedBox(height: 6),
              if (unreadCount > 0)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '$unreadCount',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
