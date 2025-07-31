import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:job_finder_app/features/utils/constants/app.colors.dart';
=======
import 'package:job_finder_app/features/utils/themes/light_mode.dart';
>>>>>>> 5904a785ff84214f29eadaaa93db9d76500db344

class SavedScrean extends StatelessWidget {
  const SavedScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: AppColors.background,
=======
      backgroundColor: CallColors.defaultColor,
>>>>>>> 5904a785ff84214f29eadaaa93db9d76500db344
      body: Center(
        child: Text(
          'Saved Your Favorite Job',
          style: TextStyle(color: Colors.green, fontSize: 28),
        ),
      ),
    );
  }
}
