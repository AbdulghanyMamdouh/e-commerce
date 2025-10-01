import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/color_manager.dart';
import 'package:shopping_app/core/widgets/search_text_field.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        SizedBox(
          width: 70.w,
          height: 22.h,
          child: Image.asset(
            'assets/images/route.png',
            width: 66.w,
            height: 22.h,
            fit: BoxFit.fill,
            color: ColorManager.darkPrimary,
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
        Row(
          children: [
            const Expanded(
              child: SearchTextField(),
            ),
            SizedBox(
              width: 24.w,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'cart');
              },
              child: ImageIcon(
                size: 24.w,
                const AssetImage('assets/images/cart.png'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
