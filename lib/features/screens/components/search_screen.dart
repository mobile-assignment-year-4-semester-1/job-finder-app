import 'package:flutter/material.dart';
import 'package:job_finder_app/features/screens/pages/job_details_screen.dart';
import 'package:job_finder_app/features/services/databases/jobs_json.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';
import 'package:job_finder_app/features/utils/themes/light_mode.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final recentSearches = ["App Developer", "UX Designer", "Product Designer"];
  List<Map<String, dynamic>> filteredJobs = [];
  String query = "";

  @override
  void initState() {
    super.initState();
    filteredJobs = jobJsonData;
  }

  void updateSearch(String value) {
    setState(() {
      query = value;
      filteredJobs =
          jobJsonData
              .where(
                (job) => job['title'].toString().toLowerCase().contains(
                  value.toLowerCase(),
                ),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: AppColors.defaultColor,
      backgroundColor: theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Search',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: updateSearch,
                      decoration: InputDecoration(
                        hintText: "Search a job or position",
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.tune),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Expanded(
                child:
                    filteredJobs.isEmpty
                        ? Center(child: Text("No jobs found"))
                        : ListView.builder(
                          itemCount: filteredJobs.length,
                          itemBuilder: (context, index) {
                            final job = filteredJobs[index];
                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ListTile(
                                leading:
                                    job['logo_url'] != null
                                        ? CircleAvatar(
                                          backgroundColor: Colors.grey[200],
                                          backgroundImage:
                                              CachedNetworkImageProvider(
                                                job['logo_url'],
                                              ),
                                        )
                                        : const CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          child: Icon(
                                            Icons.work,
                                            color: Colors.white,
                                          ),
                                        ),
                                title: Text(job['title'] ?? ''),
                                subtitle: Text(job['location_name'] ?? ''),
                                trailing: Text(job['salary_text'] ?? ''),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => JobDetailsScreen(job: job),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
