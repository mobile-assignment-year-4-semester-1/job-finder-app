
import 'package:flutter/material.dart';
import 'package:job_finder_app/features/utils/themes/light_mode.dart';

class SignUp extends StatefulWidget {
  const SignUp({ super.key });

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CallColors.defaultColor,
body: Center(child: Text('Sign Up', style: TextStyle(color: Colors.green,fontSize: 28),)),
    );
  }
}