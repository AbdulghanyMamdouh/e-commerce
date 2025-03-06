import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/color_manager.dart';
import 'package:shopping_app/core/utils/error_utils.dart';
import 'package:shopping_app/core/utils/loading_indicator.dart';
import 'package:shopping_app/features/home/domain/entity/brand_response/brand_entity.dart';

class CustomBrandItem extends StatelessWidget {
  const CustomBrandItem({
    super.key,
    required this.brand,
  });
  final BrandEntity brand;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.r,
          child: CachedNetworkImage(
            imageUrl: brand.imageURL ?? "http://via.placeholder.com/350x150",
            placeholder: (context, url) => const LoadingIndicator(),
            errorWidget: (context, url, error) => const ErrorUtils(),
            imageBuilder: (context, imageProvider) {
              return Container(
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
          brand.name ?? 'missed name!',
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
