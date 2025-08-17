import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:job_finder_app/features/screens/pages/splash_screen.dart';
import 'package:job_finder_app/widgets/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'features/screens/auth/sign_in.dart';
import 'features/screens/pages/onboading_screen.dart';
import 'features/screens/routes/app_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAuth.instance.setLanguageCode('en');
  } catch (e) {
    print('Firebase initialization error: $e');
  }

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
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.black87),
            ),
          ),

          darkTheme: ThemeData(
            primaryColor: const Color(0xFF1A2A2D),
            fontFamily: 'Roboto',
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white70),
            ),
          ),

          themeMode:
              themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,

          home: const OnboardingScreen(),
          onGenerateRoute: AppRoute.onGenerateRoute,
        );
      },
    );
  }
}
