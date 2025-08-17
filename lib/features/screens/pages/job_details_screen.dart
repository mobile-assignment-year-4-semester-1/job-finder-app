import 'package:flutter/material.dart';
import 'package:job_finder_app/features/screens/pages/resume_upload.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';

class JobDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> job;
  const JobDetailsScreen({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),

                if (job['logo_url'] != null &&
                    job['logo_url'].toString().isNotEmpty)
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: NetworkImage(job['logo_url']),
                    onBackgroundImageError: (_, __) {},
                  )
                else
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: theme.colorScheme.primary.withOpacity(0.5),
                    child: Icon(Icons.work, size: 40, color: Colors.black87),
                  ),

                const SizedBox(height: 12),

                Text(
                  job['title'] ?? '',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  job['name'] ?? '',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 16),

                Wrap(
                  spacing: 33,
                  runSpacing: 6,
                  children: [
                    if (job['seniority'] != null)
                      Chip(
                        label: Text(
                          job['seniority'],
                          style: TextStyle(color: AppColors.textWhite),
                        ),
                        backgroundColor: job['bgColor'] ?? theme.primaryColor,
                      ),
                    if (job['job_type'] != null)
                      Chip(
                        label: Text(
                          job['job_type'],
                          style: TextStyle(color: AppColors.textWhite),
                        ),
                        backgroundColor: job['bgColor'] ?? theme.primaryColor,
                      ),
                    if (job['office_type'] != null)
                      Chip(
                        label: Text(
                          job['office_type'],
                          style: TextStyle(color: AppColors.textWhite),
                        ),
                        backgroundColor: job['bgColor'] ?? theme.primaryColor,
                      ),
                  ],
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      job['salary_text'] ?? '',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 33),
                    Text(
                      job['location_name'] ?? '',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Job Description",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      job['description'] ?? '',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24),

                    if (job['responsibilities'] != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Responsibilities",
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            job['responsibilities'] ?? '',
                            style: theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),

                    if (job['requirements'] != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Requirements",
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            job['requirements'] ?? '',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                  ],
                ),

                const SizedBox(height: 80),
              ],
            ),
          ),

          Positioned(
            top: 40,
            left: 20,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(50),
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black12,
                child: Icon(Icons.arrow_back),
              ),
            ),
          ),

          Positioned(
            top: 40,
            right: 20,
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Saved!")));
              },
              borderRadius: BorderRadius.circular(50),
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black12,
                child: Icon(Icons.bookmark_border),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30),
        child: SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: job['bgColor'] ?? theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ResumeUploadScreen()),
              );
            },
            child: const Text(
              "Apply Now",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
