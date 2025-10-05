import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/color_manager.dart';
import 'package:shopping_app/features/cart/presentation/cubit/cart_view_model.dart';
import 'package:shopping_app/features/favorite/presentation/cubit/favorite_view_model.dart';

class ProductFavoriteItem extends StatelessWidget {
  const ProductFavoriteItem({
    super.key,
    required this.viewModel,
    required this.index,
  });
  final FavoriteViewModel viewModel;

  final int index;
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(15.r),
            ),
            child: CachedNetworkImage(
              imageUrl: viewModel
                      .product?.favoriteProducts?[index].imageCover ??
                  'https://ecommerce.routemisr.com/Route-Academy-products/1680399913757-cover.jpeg',
              height: double.infinity,
              width: 120.w,
              fit: BoxFit.cover,
            ),
          ),
          // SizedBox(
          //   width: 8.w,
          // ),
          Container(
            padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
            width: 130.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 3,
                  // 'title',
                  '${viewModel.product.favoriteProducts?[index].title}\n\n',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: ColorManager.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        height: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
                // SizedBox(
                //   height: 8.h,
                // ),
                Text(
                  // '10',
                  'EGP ${viewModel.product.favoriteProducts?[index].price}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: ColorManager.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    splashColor: ColorManager.white,
                    onPressed: () {
                      // viewModel.removeProductFromWishList(
                      //     productId:
                      //         viewModel.product?.favoriteProducts?[index].id ??
                      //             '');
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: 28.sp,
                      color: ColorManager.primary,
                    )),
                Container(
                  // width: 100.w,
                  // height: 36.h,
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    'Add to cart',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: ColorManager.white,
                          fontSize: 16.sp,
                        ),
                    // textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 4.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
