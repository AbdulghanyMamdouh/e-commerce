import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/color_manager.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 24.07.w),
          child: Image.asset('assets/images/search.png'),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: const BorderSide(color: ColorManager.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: const BorderSide(color: ColorManager.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: const BorderSide(color: ColorManager.primary),
        ),
        hintText: 'what do you search for?',
        fillColor: ColorManager.textColor,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: const Color.fromRGBO(6, 0, 79, 0.6),
        ),
      ),
    );
  }
}
