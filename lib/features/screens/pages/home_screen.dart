import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:job_finder_app/features/screens/components/search_screen.dart';
import 'package:job_finder_app/features/screens/pages/job_details_screen.dart';
import 'package:job_finder_app/features/screens/pages/profile_account.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';
import 'package:job_finder_app/features/utils/constants/images.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> jobs;

  HomeScreen({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final featuredJobs = jobs.where((job) => job['featured'] == 1).toList();

    final popularJobs = [...jobs];
    popularJobs.sort(
      (a, b) => (b['popularity_score'] as double).compareTo(
        a['popularity_score'] as double,
      ),
    );

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
                  children: const [WelcomeText(), ProfileMenuPopup()],
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SearchScreen()),
                    );
                  },
                  child: SearchBar(theme: theme),
                ),
                const SizedBox(height: 24),
                SectionTitle(title: "Featured Jobs", theme: theme),
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
                SectionTitle(title: "Popular Jobs", theme: theme),
                const SizedBox(height: 16),
                Column(
                  children:
                      popularJobs
                          .take(5)
                          .map((job) => PopularJobTile(job: job, theme: theme))
                          .toList(),
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

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to Job-Finder!",
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onBackground.withOpacity(0.6),
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
    );
  }
}

class SearchBar extends StatelessWidget {
  final ThemeData theme;
  const SearchBar({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(Icons.search, color: theme.iconTheme.color?.withOpacity(0.6)),
          const SizedBox(width: 8),
          Text(
            "Search a job or position",
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final ThemeData theme;
  const SectionTitle({super.key, required this.title, required this.theme});

  @override
  Widget build(BuildContext context) {
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
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

class FeaturedJobCard extends StatelessWidget {
  final Map<String, dynamic> job;
  const FeaturedJobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => JobDetailsScreen(job: job)),
        );
      },
      child: Container(
        width: 280,
        margin: const EdgeInsets.only(right: 17),
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: job['bgColor'] ?? Colors.blueGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                job['logo_url'] != null && job['logo_url'].toString().isNotEmpty
                    ? ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: job['logo_url'],
                        fit: BoxFit.cover,
                        width: 58,
                        height: 58,
                        placeholder:
                            (context, url) => const Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                        errorWidget:
                            (context, url, error) => const Icon(
                              Icons.error,
                              size: 40,
                              color: Colors.red,
                            ),
                      ),
                    )
                    : const Icon(Icons.work, size: 40, color: Colors.black87),

                const SizedBox(width: 14),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job['title'] ?? '',
                      style: const TextStyle(
                        color: AppColors.textWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      job['name'] ?? '',
                      style: const TextStyle(color: AppColors.textWhite),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 14),

            Wrap(
              spacing: 6,
              runSpacing: 2,
              children: [
                for (var type in [
                  job['seniority'],
                  job['job_type'],
                  job['office_type'],
                ])
                  if (type != null && type.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        type,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
              ],
            ),

            const SizedBox(height: 14),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  job['salary_text'] ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                Text(
                  job['location_name'] ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PopularJobTile extends StatelessWidget {
  final Map<String, dynamic> job;
  final ThemeData theme;
  const PopularJobTile({super.key, required this.job, required this.theme});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => JobDetailsScreen(job: job)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            job['logo_url'] != null && job['logo_url'].toString().isNotEmpty
                ? ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: job['logo_url'],
                    fit: BoxFit.cover,
                    width: 44,
                    height: 44,
                    placeholder:
                        (context, url) => const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                    errorWidget:
                        (context, url, error) => const Icon(
                          Icons.error,
                          size: 40,
                          color: Colors.red,
                        ),
                  ),
                )
                : const Icon(Icons.work, size: 40, color: Colors.black87),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job['title'] ?? '',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    job['company_id'] ?? '',
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
                  job['salary_text'] ?? '',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  job['location_id'] ?? '',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
