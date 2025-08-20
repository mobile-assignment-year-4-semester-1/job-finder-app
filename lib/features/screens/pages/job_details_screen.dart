import 'package:flutter/material.dart';
import 'package:job_finder_app/features/screens/auth/sign_in.dart';
import 'package:job_finder_app/features/utils/auth_helper.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:job_finder_app/features/utils/constants/icons.dart';

class JobDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> job;

  JobDetailsScreen({super.key, required this.job});

  bool isLoggedIn() {
    return false;
  }

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
                CircleAvatar(
                  radius: 40,
                  child:
                      job['logo_url'] != null &&
                              job['logo_url'].toString().isNotEmpty
                          ? ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: job['logo_url'],
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
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
                  spacing: 15,
                  runSpacing: 6,
                  children: [
                    if (job['seniority']?.toString().isNotEmpty ?? false)
                      _JobChip(
                        label: job['seniority'],
                        color: job['bgColor'] ?? theme.primaryColor,
                      ),
                    if (job['job_type']?.toString().isNotEmpty ?? false)
                      _JobChip(
                        label: job['job_type'],
                        color: job['bgColor'] ?? theme.primaryColor,
                      ),
                    if (job['office_type']?.toString().isNotEmpty ?? false)
                      _JobChip(
                        label: job['office_type'],
                        color: job['bgColor'] ?? theme.primaryColor,
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

                Align(
                  alignment: Alignment.topCenter,
                  child: _Section(
                    title: "Job Description",
                    text: job['description'],
                  ),
                ),
                if (job['responsibilities']?.toString().isNotEmpty ?? false)
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: _Section(
                        title: "Responsibilities",
                        text: job['responsibilities'],
                      ),
                    ),
                  ),
                if (job['requirements']?.toString().isNotEmpty ?? false)
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: _Section(
                        title: "Requirements",
                        text: job['requirements'],
                      ),
                    ),
                  ),

                const SizedBox(height: 80),
              ],
            ),
          ),

          Positioned(
            top: 40,
            left: 20,
            child: _CircleIconButton(
              icon: Icons.arrow_back,
              onTap: () => Navigator.pop(context),
            ),
          ),

          Positioned(
            top: 40,
            right: 20,
            child: _CircleIconButton(
              icon: Icons.bookmark_border,
              onTap: () {
                AuthHelper.handleBookmark(context, job);
              },
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
              AuthHelper.handleApply(context, job);
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

class _JobChip extends StatelessWidget {
  final String label;
  final Color color;

  const _JobChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label, style: const TextStyle(color: Colors.white)),
      backgroundColor: color,
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final dynamic text;

  const _Section({Key? key, required this.title, required this.text})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          if (text is String)
            Text(text, style: theme.textTheme.bodyMedium)
          else if (text is List<String>)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  (text as List<String>).map((e) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [const Text("• "), Expanded(child: Text(e))],
                      ),
                    );
                  }).toList(),
            ),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.grey[200],
        child: Icon(icon, color: AppColors.black),
      ),
    );
  }
}

Future<void> showCustomLoginDialog(
  BuildContext context,
  Map<String, dynamic> job,
) {
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;

  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Scaffold(
          backgroundColor: Colors.black54,
          body: Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 420,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 22,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      (job['bgColor'] as Color?)?.withOpacity(0.3) ??
                          Colors.grey.withOpacity(0.3),
                      (job['bgColor'] as Color?) ?? Colors.grey,
                    ],

                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.login_rounded,
                          color: theme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Sign in with Job Finder',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.textWhite,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // backgroundColor: colorScheme.background,
                            backgroundColor: AppColors.background,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Future.microtask(() {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const SignIn(),
                                ),
                              );
                            });
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: job['bgColor'] ?? theme.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Expanded(child: Divider(thickness: 1)),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              'Or sign in with',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.textWhite,
                              ),
                            ),
                          ),
                          const Expanded(child: Divider(thickness: 1)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _SocialIconButton(
                            asset: CallIcons.google,
                            onTap: () {},
                          ),
                          _SocialIconButton(
                            asset: CallIcons.facebook,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

class _SocialIconButton extends StatelessWidget {
  final String asset;
  final VoidCallback onTap;

  const _SocialIconButton({required this.asset, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Image.asset(asset, width: 22, height: 22, fit: BoxFit.contain),
      ),
    );
  }
}
