import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/color_manager.dart';

class DefaultElevatedButton extends StatelessWidget {
  const DefaultElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
  });
  final void Function()? onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(ColorManager.white),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(398.w, 64.h),
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: ColorManager.darkPrimary,
            ),
      ),
    );
  }
}
