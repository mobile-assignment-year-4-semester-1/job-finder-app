import 'package:flutter/material.dart';
import 'package:job_finder_app/features/screens/components/search_screen.dart';
import 'package:job_finder_app/features/screens/pages/profile_account.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
        'bgColor': const Color(0xFF6281a7),
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
      backgroundColor: theme.scaffoldBackgroundColor,
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
                      children: [
                        Text(
                          "Welcome to Job-Finder!",
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onBackground.withOpacity(
                              0.6,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Discover Jobs 🔥",
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const ProfileMenuPopup(),
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
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: theme.iconTheme.color?.withOpacity(0.6),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Search a job or position",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Featured Jobs
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured Jobs",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See all",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
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
                  children: [
                    Text(
                      "Popular Jobs",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See all",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ...popularJobs.map(
                  (job) => PopularJobTile(job: job, theme: theme),
                ),
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
                  color: Colors.white.withOpacity(0.15),
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
  final ThemeData theme;
  const PopularJobTile({super.key, required this.job, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: theme.scaffoldBackgroundColor,
            child: Text(job['logo'], style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job['title'],
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  job['company'],
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                job['salary'],
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                job['location'],
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
