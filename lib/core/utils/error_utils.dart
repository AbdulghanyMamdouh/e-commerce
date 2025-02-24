import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorUtils extends StatelessWidget {
  const ErrorUtils({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 100),
          SizedBox(
            height: 30.h,
          ),
          const Text(
            '''         Oops!.. 
               something went wrong''',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Please try again later',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
