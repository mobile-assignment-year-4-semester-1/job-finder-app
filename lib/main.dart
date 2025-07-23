import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:job_finder_app/features/screens/pages/splash_screen.dart';
import 'package:job_finder_app/widgets/theme_provider.dart';
import 'package:provider/provider.dart';

import 'features/screens/auth/sign_in.dart';
import 'features/screens/routes/app_route.dart';
Future<void> main() async {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const JobFinder(),
    ),
  );
}

class JobFinder extends StatelessWidget {
  const JobFinder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: AppRoute.key,
          theme: ThemeData(
            primaryColor: const Color(0xFF2F4B4E),
            fontFamily: 'Roboto',
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            primaryColor: const Color(0xFF1A2A2D),
            fontFamily: 'Roboto',
            brightness: Brightness.dark,
          ),
          themeMode:
              themeProvider.isDarkMode ? ThemeMode.light : ThemeMode.dark,
          home: const SignIn(),
          onGenerateRoute: AppRoute.onGenerateRoute,
        );
      },
    );
  }
}