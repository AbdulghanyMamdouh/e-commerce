import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:read_more_text/read_more_text.dart';
import 'package:shopping_app/core/theme/color_manager.dart';
import 'package:shopping_app/core/utils/error_utils.dart';
import 'package:shopping_app/core/utils/loading_indicator.dart';

import 'package:shopping_app/features/product/domain/entity/product_entity.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: 191.w,
      height: 357.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  //todo: imageCoverURL
                  imageUrl: product.imageCover ??
                      'https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg',
                  placeholder: (context, url) => const LoadingIndicator(),
                  errorWidget: (context, url, error) => const ErrorUtils(),

                  fit: BoxFit.fill,
                  width: 191.w,
                  height: 128.h,
                ),
              ),
              Positioned(
                left: 120.w,
                top: 8.h,
                child: CircleAvatar(
                  radius: 24.r,
                  //todo: change color
                  backgroundColor: ColorManager.white,
                  child: IconButton(
                    onPressed: () async {},
                    icon: const Icon(
                      Icons.favorite_border,
                      //todo: change color
                      color: ColorManager.primary,
                      size: 35.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            //todo: product desc
            product.description ?? '',
            maxLines: 3,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: ColorManager.textColor,
            ),
            overflow: TextOverflow.ellipsis,
            selectionColor: Colors.transparent,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            //todo: price
            'EGP ${product.price.toString()}',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: ColorManager.textColor,
            ),
            overflow: TextOverflow.ellipsis,
            selectionColor: Colors.transparent,
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              Text(
                //todo: rating average
                'Review (${product.ratingsAverage.toString()})',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.textColor,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              const Icon(
                Icons.star,
                color: ColorManager.yellow,
              ),
              SizedBox(
                width: 30.w,
              ),
              Icon(
                //todo: change to add icon to the cart
                Icons.add_circle_outline_sharp,
                color: ColorManager.primary,
                size: 27.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
