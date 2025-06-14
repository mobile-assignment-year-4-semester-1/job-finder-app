

import 'package:flutter/material.dart';

class Verify extends StatefulWidget {
  const Verify({ super.key });

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Verify Page', style: TextStyle(color: Colors.green,fontSize: 28),)),
    );
  }
}