
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({ super.key });

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(child: Text('Sign Up', style: TextStyle(color: Colors.green,fontSize: 28),)),
    );
  }
}