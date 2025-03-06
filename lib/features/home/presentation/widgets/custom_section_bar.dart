import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shopping_app/core/theme/color_manager.dart';

class CustomSectionBar extends StatelessWidget {
  const CustomSectionBar({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 24.h,
        bottom: 16.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorManager.textColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              'View All',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.textColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
