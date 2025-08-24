import 'package:flutter/material.dart';
import 'package:job_finder_app/features/utils/themes/light_mode.dart';

class Forgetpass extends StatefulWidget {
  const Forgetpass({super.key});

  @override
  _ForgetpassState createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CallColors.defaultColor,
      body: Center(
        child: Text(
          'Forget Password',
          style: TextStyle(color: Colors.green, fontSize: 28),
        ),
      ),
    );
  }
}
