import 'package:flutter/material.dart';
import 'package:job_finder_app/features/screens/auth/forgetpass.dart';
import 'package:job_finder_app/features/screens/auth/resetpass.dart';
import 'package:job_finder_app/features/screens/auth/sign_in.dart';
import 'package:job_finder_app/features/screens/auth/sign_up.dart';
import 'package:job_finder_app/features/screens/auth/verify.dart';
import 'package:job_finder_app/features/screens/pages/default_screen.dart';
import 'package:job_finder_app/features/screens/pages/splash_screen.dart';

class AppRoute {
  static const String splashScreen = "";
  static const String signinScreen = "Sign In";
  static const String signupScreen = "Sign Up";
  static const String forgetpassScreen = "Forget Password";
  static const String resetpassScreen = "Reset Password";
  static const String verifyScreen = "Verify";
  static const String mainScreen = "Main Screen";

  static final key = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashScreen:
        return _buildRoute(routeSettings, SplashScreen());
      case signinScreen:
        return _buildRoute(routeSettings, SignIn());
      case signupScreen:
        return _buildRoute(routeSettings, SignUp());
      case forgetpassScreen:
        return _buildRoute(routeSettings, Forgetpass());
      case resetpassScreen:
        return _buildRoute(routeSettings, Resetpass());
      case verifyScreen:
        return _buildRoute(routeSettings, Verify());
      case mainScreen:
        return _buildRoute(routeSettings, DefaultScreen());
      default:
        throw RouteException("Route not found!");
    }
  }

  static Route<dynamic> _buildRoute(
    RouteSettings routeSettings,
    Widget newScreen,
  ) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (BuildContext context) => newScreen,
    );
  }
}

class RouteException implements Exception {
  String message;

  RouteException(this.message);
}