

import 'package:flutter/material.dart';

class Resetpass extends StatefulWidget {
  const Resetpass({ super.key });

  @override
  _ResetpassState createState() => _ResetpassState();
}

class _ResetpassState extends State<Resetpass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Reset Password', style: TextStyle(color: Colors.green,fontSize: 28),)),
    );
  }
}