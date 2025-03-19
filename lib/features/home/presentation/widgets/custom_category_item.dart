import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/color_manager.dart';

import 'package:shopping_app/core/utils/loading_indicator.dart';
import 'package:shopping_app/features/home/domain/entity/category_response/category_entity.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    required this.category,
  });
  final CategoryEntity category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.r,
          child: category.name == "Women's Fashion"
              ? Image.asset('assets/images/wf.png')
              : CachedNetworkImage(
                  imageUrl:
                      category.imageURL ?? "http://via.placeholder.com/350x150",
                  placeholder: (context, url) => const LoadingIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          category.name ?? 'missed name!',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: ColorManager.textColor,
              ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
