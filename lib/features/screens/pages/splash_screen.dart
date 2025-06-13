import 'dart:async';
import 'package:flutter/material.dart';
import 'package:job_finder_app/features/screens/pages/onboading_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String displayText = "";
  final String fullText = "Furniture";
  int charIndex = 0;

  @override
  void initState() {
    super.initState();
    _textAnimationloading();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  void _textAnimationloading() {
    Timer.periodic(const Duration(milliseconds: 118), (Timer timer) {
      if (charIndex < fullText.length) {
        setState(() {
          displayText += fullText[charIndex];
          charIndex++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          displayText,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2F4B4E),
          ),
        ),
      ),
    );
  }
}