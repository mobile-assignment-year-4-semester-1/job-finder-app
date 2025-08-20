import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_finder_app/features/screens/pages/confirm_screen.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';

class ApplyScreen extends StatefulWidget {
  const ApplyScreen({super.key, required Map<String, dynamic> job});

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  int selectedProfile = 0;
  int selectedResume = 0;

  String getUserName() {
    final email = FirebaseAuth.instance.currentUser?.email ?? "User";
    return email.split('@').first.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apply Now"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select a profile",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _profileCard(
                  index: 0,
                  title: getUserName(),
                  subtitle: "Job Seeker",
                  avatar:
                      "https://static.vecteezy.com/system/resources/previews/024/183/502/non_2x/male-avatar-portrait-of-a-young-man-with-a-beard-illustration-of-male-character-in-modern-color-style-vector.jpg",
                ),
                const SizedBox(width: 12),
                _profileCard(
                  index: 1,
                  title: getUserName(),
                  subtitle: "Job Seeker",
                  avatar:
                      "https://img.freepik.com/free-vector/smiling-woman-with-braided-hair_1308-174961.jpg?semt=ais_hybrid&w=740",
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              "Select a resume",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _resumeChip(0, getUserName()),
                const SizedBox(width: 5),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              "Leave Your Message (Optional)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Write a here ......",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: AppColors.success,
                    content: Text(
                      "Applying...",
                      style: TextStyle(color: AppColors.textWhite),
                      textAlign: TextAlign.center,
                    ),
                    duration: Duration(seconds: 4),
                  ),
                );

                Future.delayed(const Duration(seconds: 3), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfirmationScreen(),
                    ),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Apply Now",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileCard({
    required int index,
    required String title,
    required String subtitle,
    required String avatar,
  }) {
    final isSelected = selectedProfile == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedProfile = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? AppColors.success : Colors.grey.shade300,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(avatar),
                  ),
                  if (isSelected)
                    const CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColors.success,
                      child: Icon(Icons.check, size: 14, color: Colors.white),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _resumeChip(int index, String label) {
    final theme = Theme.of(context);
    final isSelected = selectedResume == index;

    return ChoiceChip(
      selected: isSelected,
      label: Text(label),
      avatar:
          isSelected
              ? const Icon(Icons.check_circle, color: Colors.green, size: 20)
              : CircleAvatar(
                backgroundColor: Colors.grey.shade400,
                child: Text(
                  label[0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
      onSelected: (_) {
        setState(() {
          selectedResume = index;
        });
      },
      selectedColor: Colors.green.shade100,
      labelStyle: TextStyle(
        fontSize: 13.5,
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onBackground,
      ),
    );
  }
}
