import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    final theme = Theme.of(context);

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
            // Row(
            //   children: [
            //     const CircleAvatar(
            //       radius: 24,
            //       backgroundColor: Colors.green,
            //       child: Icon(Icons.music_note, color: Colors.white),
            //     ),
            //     const SizedBox(width: 12),
            //     Expanded(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: const [
            //           Text(
            //             "UX Intern",
            //             style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           Text("Spotify"),
            //         ],
            //       ),
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       children: const [
            //         Text(
            //           "\$88,000/y",
            //           style: TextStyle(
            //             fontSize: 16,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         Text("Los Angeles, US"),
            //       ],
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 24),
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
                  avatar: "https://i.pravatar.cc/150?img=47",
                ),
                const SizedBox(width: 12),
                _profileCard(
                  index: 1,
                  title: getUserName(),
                  subtitle: "Job Seeker",
                  avatar: "https://i.pravatar.cc/150?img=48",
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
                _resumeChip(0, "UX Designer"),
                const SizedBox(width: 5),
                _resumeChip(1, "Product Designer"),
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Apply Now",
                style: TextStyle(color: AppColors.textWhite),
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
      label: Text(getUserName()),

      avatar: CircleAvatar(
        backgroundColor: isSelected ? AppColors.grey : Colors.grey.shade400,
        child: Text(label[0]),
      ),
      onSelected: (_) {
        setState(() {
          selectedResume = index;
        });
      },
      selectedColor: isSelected ? Colors.green.shade100 : null,
      labelStyle: TextStyle(
        fontSize: 13.5,
        fontWeight: FontWeight.bold,
        color:
            isSelected
                ? theme.colorScheme.onBackground
                : theme.colorScheme.onBackground,
      ),
    );
  }
}
