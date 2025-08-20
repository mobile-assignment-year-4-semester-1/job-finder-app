import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_finder_app/features/screens/pages/apply_job.dart';
import 'package:job_finder_app/features/screens/pages/job_details_screen.dart';
import 'package:job_finder_app/features/screens/pages/resume_upload.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static Future<void> handleApply(
    BuildContext context,
    Map<String, dynamic> job,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn && FirebaseAuth.instance.currentUser != null) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => ResumeUploadScreen()));
    } else {
      showCustomLoginDialog(context, job);
    }
  }

  static Future<void> handleBookmark(
    BuildContext context,
    Map<String, dynamic> job,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final user = FirebaseAuth.instance.currentUser;

    if (isLoggedIn && user != null) {
      final key = "savedJobs_${user.uid}";
      final savedList = prefs.getStringList(key) ?? [];

      final jobId = job['id'].toString();
      bool alreadySaved = savedList.contains(jobId);

      if (alreadySaved) {
        savedList.remove(jobId);
        await prefs.setStringList(key, savedList);
        await prefs.remove("jobData_$jobId");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              "Job removed from saved",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            duration: const Duration(seconds: 1),
            backgroundColor: AppColors.error,
          ),
        );
      } else {
        final safeJob = Map<String, dynamic>.from(job);
        safeJob.remove('bgColor');

        savedList.add(jobId);
        await prefs.setStringList(key, savedList);
        await prefs.setString("jobData_$jobId", jsonEncode(safeJob));

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              "Jobs saved",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            duration: const Duration(seconds: 1),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } else {
      showCustomLoginDialog(context, job);
    }
  }

  static Future<List<Map<String, dynamic>>> loadSavedJobs() async {
    final prefs = await SharedPreferences.getInstance();
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return [];

    final key = "savedJobs_${user.uid}";
    final savedList = prefs.getStringList(key) ?? [];

    List<Map<String, dynamic>> jobs = [];
    for (String jobId in savedList) {
      final jobString = prefs.getString("jobData_$jobId");
      if (jobString != null) {
        final jobMap = jsonDecode(jobString) as Map<String, dynamic>;

        jobMap['bgColor'] = AppColors.background;

        jobs.add(jobMap);
      }
    }
    return jobs;
  }

  static Future<List<Map<String, dynamic>>> getSavedJobs() async {
    final prefs = await SharedPreferences.getInstance();
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return [];
    final key = "savedJobs_${user.uid}";

    final savedIds = prefs.getStringList(key) ?? [];
    List<Map<String, dynamic>> jobs = [];

    for (var id in savedIds) {
      final jobJson = prefs.getString("jobData_$id");
      if (jobJson != null) {
        jobs.add(jsonDecode(jobJson));
      }
    }
    return jobs;
  }
}
