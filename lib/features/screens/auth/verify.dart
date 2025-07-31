

import 'package:flutter/material.dart';
import 'package:job_finder_app/features/utils/themes/light_mode.dart';

class Verify extends StatefulWidget {
  const Verify({ super.key });

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CallColors.defaultColor,
      body: Center(child: Text('Verify Page', style: TextStyle(color: Colors.green,fontSize: 28),)),
    );
  }
}