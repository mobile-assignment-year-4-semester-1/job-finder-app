import 'package:flutter/material.dart';
import 'package:job_finder_app/features/utils/themes/light_mode.dart';

class SignIn extends StatefulWidget {
  const SignIn({ super.key });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CallColors.defaultColor,
      body: Center(child: Text('Sign In', style: TextStyle(color: Colors.green,fontSize: 28),)),
    );
  }
}