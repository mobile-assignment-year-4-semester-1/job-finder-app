import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_finder_app/features/screens/auth/sign_in.dart';
import 'package:job_finder_app/features/utils/constants/images.dart';
import 'package:provider/provider.dart';
import 'package:job_finder_app/widgets/theme_provider.dart';

class ProfileMenuPopup extends StatelessWidget {
  const ProfileMenuPopup({super.key});

  void _openProfileMenu(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Profile Menu",
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        final screenWidth = MediaQuery.of(context).size.width;

        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: screenWidth * 0.6,
              height: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(CallImages.userProfile),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      (FirebaseAuth.instance.currentUser?.email ?? 'User')
                          .split('@')
                          .first,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onBackground,
                      ),
                    ),
                    Divider(
                      height: 24,
                      color: colorScheme.onBackground.withOpacity(0.3),
                    ),
                    _menuItem(context, Icons.person_outline, "Personal Info"),
                    _menuItem(
                      context,
                      Icons.file_copy_outlined,
                      "Applications",
                    ),
                    _menuItem(context, Icons.assignment_outlined, "Proposals"),
                    _menuItem(context, Icons.description_outlined, "Resumes"),
                    _menuItem(context, Icons.work_outline, "Portfolio"),
                    _menuItem(context, Icons.mail_outline, "Cover Letters"),

                    Consumer<ThemeProvider>(
                      builder: (context, themeProvider, child) {
                        return SwitchListTile(
                          contentPadding: const EdgeInsets.only(
                            left: 30,
                            right: 16,
                          ),
                          title: Text(
                            "Dark Mode",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onBackground,
                            ),
                          ),
                          value: themeProvider.isDarkMode,
                          onChanged: (value) {
                            themeProvider.toggleTheme(value);
                          },
                        );
                      },
                    ),

                    ListTile(
                      contentPadding: const EdgeInsets.only(left: 30),
                      leading: Icon(Icons.logout, color: colorScheme.error),
                      title: Text(
                        "Logout",
                        style: TextStyle(
                          color: colorScheme.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        Get.offAll(SignIn());
                      },
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        minimumSize: const Size(double.infinity, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: Icon(Icons.star, color: colorScheme.onPrimary),
                      label: Text(
                        "Membership",
                        style: TextStyle(color: colorScheme.onPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  Widget _menuItem(BuildContext context, IconData icon, String title) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 30),
      leading: Icon(icon, color: theme.iconTheme.color),
      title: Text(
        title,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onBackground,
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => _openProfileMenu(context),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(CallImages.userProfile),
            backgroundColor: colorScheme.surface, // dynamic background
          ),
          Positioned(
            right: 0,
            top: 1,
            child: CircleAvatar(
              radius: 6,
              backgroundColor: colorScheme.error, // dynamic notification dot
            ),
          ),
        ],
      ),
    );
  }
}
