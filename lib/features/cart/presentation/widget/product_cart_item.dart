import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/color_manager.dart';

class ProductCartItem extends StatelessWidget {
  const ProductCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 398.w,
      height: 113.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          border: Border.all(color: ColorManager.primary, width: 1.w)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(15.r),
            ),
            child: CachedNetworkImage(
              imageUrl:
                  'https://ecommerce.routemisr.com/Route-Academy-products/1680399913757-cover.jpeg',
              height: double.infinity,
              width: 120.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'product title\n\n',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: ColorManager.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                ),
                TextSpan(
                  text: 'product price',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: ColorManager.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_outline,
                        size: 28.sp,
                      )),
                  Container(
                    width: 122.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.r),
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          iconSize: 28.sp,
                          color: ColorManager.white,
                          onPressed: () {},
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          '1',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 20.sp,
                                    color: ColorManager.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        IconButton(
                          iconSize: 28.sp,
                          color: ColorManager.white,
                          onPressed: () {},
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
