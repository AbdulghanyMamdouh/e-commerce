import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/color_manager.dart';

class AnnouncementSection extends StatelessWidget {
  const AnnouncementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: ImageSlideshow(
        width: 398.w,
        height: 200.h,
        isLoop: true,
        autoPlayInterval: 3000,
        indicatorRadius: 5.w,
        indicatorColor: ColorManager.primary,
        indicatorBackgroundColor: ColorManager.white,
        children: [
          Image.asset(
            'assets/images/ann1.png',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/ann2.png',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/ann3.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
