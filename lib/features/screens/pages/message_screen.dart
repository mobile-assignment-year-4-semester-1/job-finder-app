import 'package:flutter/material.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';
import 'package:job_finder_app/features/utils/themes/light_mode.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Messages',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.green),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.green),
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
                prefixIcon: const Icon(Icons.search),
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
              "assets/logos/google-icon.png",
              4,
            ),
            _chatItem(
              "FaceBook",
              "We are looking forward to takin...",
              "11:45 am",
              "assets/logos/facebook-icon.webp",
              1,
            ),
            _chatItem(
              "Apple",
              "Are you available for an interview",
              "11:45 am",
              "assets/logos/apple-icon.png",
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
              "assets/images/rithadric.jpg",
              7,
            ),
            _chatItem(
              "Pich Chimi",
              "I checked your portfolio. It looks...",
              "11:45 am",
              "assets/images/pich_chimi.jpeg",
              3,
            ),
            _chatItem(
              "Tak Vanneth",
              "Are you available for an interview",
              "11:45 am",
              "assets/images/takvanneth.jpeg",
              6,
            ),
            _chatItem(
              "Lim Pheakdey",
              "I want to be a cheapman",
              "11:45 am",
              "assets/images/kdey.jpeg",
              1,
            ),
            _chatItem(
              "Tep Minea",
              "Why are you gey",
              "11:45 am",
              "assets/images/nea.jpeg",
              12,
            ),
          ],
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
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 24,
            backgroundColor: Colors.grey[200],
          ),
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
