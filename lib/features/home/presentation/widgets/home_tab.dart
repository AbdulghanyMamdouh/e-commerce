import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/widgets/custom_app_bar.dart';
import 'package:shopping_app/features/home/presentation/widgets/announcement_section.dart';
import 'package:shopping_app/features/home/presentation/widgets/brand_section.dart';
import 'package:shopping_app/features/home/presentation/widgets/category_section.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_section_bar.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.w),
        child: const Column(
          children: [
            CustomAppBar(),
            AnnouncementSection(),
            CustomSectionBar(
              title: 'Category',
            ),
            CategorySection(),
            CustomSectionBar(
              title: 'Brand',
            ),
            BrandSection(),
          ],
        ),
      ),
    );
  }
}
