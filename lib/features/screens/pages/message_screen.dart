

import 'package:flutter/material.dart';
import 'package:job_finder_app/features/utils/themes/light_mode.dart';

class MessageScreen extends StatelessWidget {
const MessageScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: CallColors.defaultColor,
      body: Center(child: Text('Message Page', style: TextStyle(color: Colors.green,fontSize: 28),)),
    );
  }
}