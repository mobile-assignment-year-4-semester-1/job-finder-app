

import 'package:flutter/material.dart';
import 'package:job_finder_app/features/utils/themes/light_mode.dart';

class Resetpass extends StatefulWidget {
  const Resetpass({ super.key });

  @override
  _ResetpassState createState() => _ResetpassState();
}

class _ResetpassState extends State<Resetpass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CallColors.defaultColor,
      body: Center(child: Text('Reset Password', style: TextStyle(color: Colors.green,fontSize: 28),)),
    );
  }
}