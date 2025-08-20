import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:job_finder_app/features/utils/auth_helper.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';

class SavedJobsScreen extends StatefulWidget {
  const SavedJobsScreen({super.key});

  @override
  _SavedJobsScreenState createState() => _SavedJobsScreenState();
}

class _SavedJobsScreenState extends State<SavedJobsScreen> {
  List<Map<String, dynamic>> savedJobs = [];

  @override
  void initState() {
    super.initState();
    _loadJobs();
  }

  Future<void> _loadJobs() async {
    final jobs = await AuthHelper.loadSavedJobs();
    setState(() {
      savedJobs = jobs;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Jobs"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: "Reload saved jobs",
            onPressed: () async {
              await _loadJobs();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text(
                    "Jobs refreshed",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  duration: const Duration(seconds: 1),
                  // backgroundColor: theme.colorScheme.onBackground,
                  backgroundColor: AppColors.success,
                ),
              );
            },
          ),
        ],
      ),
      body:
          savedJobs.isEmpty
              ? const Center(child: Text("No saved jobs yet"))
              : RefreshIndicator(
                onRefresh: _loadJobs,
                child: ListView.builder(
                  itemCount: savedJobs.length,
                  itemBuilder: (context, index) {
                    final job = savedJobs[index];

                    return ListTile(
                      contentPadding: const EdgeInsets.only(
                        left: 22,
                        top: 8,
                        right: 22,
                        bottom: 8,
                      ),
                      leading:
                          job['logo_url'] != null &&
                                  job['logo_url'].toString().isNotEmpty
                              ? ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: job['logo_url'],
                                  fit: BoxFit.cover,
                                  width: 55,
                                  height: 55,
                                  placeholder:
                                      (context, url) => const Center(
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      ),
                                  errorWidget:
                                      (context, url, error) => const Icon(
                                        Icons.error,
                                        size: 40,
                                        color: Colors.red,
                                      ),
                                ),
                              )
                              : const Icon(
                                Icons.work,
                                size: 40,
                                color: Colors.black87,
                              ),
                      title: Text(job['title'] ?? "No title"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(job['location_name'] ?? "Unknown location"),
                          if (job['salary_text'] != null)
                            Text("💰 ${job['salary_text']}"),
                          if (job['popularity_score'] != null)
                            Text("🔥 Popularity: ${job['popularity_score']}"),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.bookmark_remove,
                          color: Colors.red,
                        ),
                        onPressed: () async {
                          await AuthHelper.handleBookmark(context, job);
                          await _loadJobs();
                        },
                      ),
                    );
                  },
                ),
              ),
    );
  }
}
