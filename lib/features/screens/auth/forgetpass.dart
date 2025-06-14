

import 'package:flutter/material.dart';

class Forgetpass extends StatefulWidget {
  const Forgetpass({ super.key });

  @override
  _ForgetpassState createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Forget Password', style: TextStyle(color: Colors.green,fontSize: 28),)),
    );
  }
}