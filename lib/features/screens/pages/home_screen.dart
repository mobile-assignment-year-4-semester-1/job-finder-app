import 'package:flutter/material.dart';
import 'package:job_finder_app/features/screens/components/search_screen.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';
import 'package:job_finder_app/features/utils/constants/images.dart';
import 'package:job_finder_app/features/utils/themes/light_mode.dart';
import 'package:job_finder_app/features/screens/auth/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredJobs = [
      {
        'company': 'Facebook',
        'position': 'Software Engineer',
        'location': 'California, USA',
        'salary': '\$180,000/year',
        'type': ['IT', 'Full-Time', 'Junior'],
        'logo': Icons.facebook,
        'bgColor': Colors.blue,
      },
      {
        'company': 'Dribbble',
        'position': 'Designer',
        'location': 'New York, USA',
        'salary': '\$160,000/year',
        'type': ['Design', 'Remote', 'Senior'],
        'logo': Icons.palette,
        'bgColor': Colors.orange,
      },
      {
        'company': 'Rith Adric',
        'position': 'Software Development',
        'location': 'Phnom Penh, Cambodia',
        'salary': '\$180,000/year',
        'type': ['Window', 'Mac', 'linux'],
        'logo': Icons.palette,
        'bgColor': Color(0xFF6281a7),
      },
    ];

    final popularJobs = [
      {
        'title': 'Jr Executive',
        'company': 'Burger King',
        'salary': '\$96,000/y',
        'location': 'Los Angeles, US',
        'logo': '🍔',
      },
      {
        'title': 'Product Manager',
        'company': 'Beats',
        'salary': '\$84,000/y',
        'location': 'Florida, US',
        'logo': '🎧',
      },
    ];

    return Scaffold(
      backgroundColor: CallColors.defaultColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Welcome to Job-Finder!",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Discover Jobs 🔥",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    PopupMenuButton<int>(
                      offset: const Offset(0, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      color: AppColors.accent,
                      onSelected: (value) {
                        if (value == 1) {
                          FirebaseAuth.instance.signOut();
                          Get.offAll(SignIn());
                        }
                      },
                      itemBuilder:
                          (context) => [
                            PopupMenuItem<int>(
                              value: 0,
                              enabled: false,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                child: Text(
                                  (FirebaseAuth.instance.currentUser?.email ??
                                          'User')
                                      .split('@')
                                      .first,
                                  style: const TextStyle(
                                    color: AppColors.textWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const PopupMenuDivider(),
                            PopupMenuItem<int>(
                              value: 1,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.logout, color: AppColors.error),
                                    SizedBox(width: 8),
                                    Text(
                                      "Logout",
                                      style: TextStyle(
                                        color: AppColors.textWhite,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                      child: Stack(
                        children: [
                          Image.asset(CallImages.userProfile, height: 44),
                          const Positioned(
                            right: 0,
                            top: 1,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Search bar
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SearchScreen()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 8),
                        Text(
                          "Search a job or position",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Featured Jobs
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Featured Jobs",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("See all", style: TextStyle(color: Colors.blueAccent)),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: featuredJobs.length,
                    itemBuilder: (context, index) {
                      final job = featuredJobs[index];
                      return FeaturedJobCard(job: job);
                    },
                  ),
                ),
                const SizedBox(height: 24),

                // Popular Jobs
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Popular Jobs",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("See all", style: TextStyle(color: Colors.blueAccent)),
                  ],
                ),
                const SizedBox(height: 16),
                ...popularJobs.map((job) => PopularJobTile(job: job)),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Featured Job Card Widget
class FeaturedJobCard extends StatelessWidget {
  final Map job;
  const FeaturedJobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 17),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: job['bgColor'],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(job['logo'], color: Colors.white70, size: 28),
          const SizedBox(height: 4),
          Text(
            job['position'],
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(job['company'], style: const TextStyle(color: Colors.white60)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 2,
            children: List.generate(
              job['type'].length,
              (i) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(45, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  job['type'][i],
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                job['salary'],
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              const Spacer(),
              Text(
                job['location'],
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Popular Job Tile Widget
class PopularJobTile extends StatelessWidget {
  final Map job;
  const PopularJobTile({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: Text(job['logo'], style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  job['company'],
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                job['salary'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                job['location'],
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
