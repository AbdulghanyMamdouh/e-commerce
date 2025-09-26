import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/widgets/custom_app_bar.dart';
import 'package:shopping_app/features/product/presentation/widget/product_section.dart';

class ProductTab extends StatelessWidget {
  const ProductTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: CustomAppBar(),
        ),
        SizedBox(
          height: 16.h,
        ),
        Expanded(child: ProductSection()),
      ],
    );
    //  Container(
    //   padding: EdgeInsets.all(16.w),
    //   child: Column(
    //     children: [
    //       const CustomAppBar(),
    //       SizedBox(
    //         height: 16.h,
    //       ),
    //       ProductSection(),
    //     ],
    //   ),
    // );
  }
}
