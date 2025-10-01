import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/color_manager.dart';
import 'package:shopping_app/features/cart/presentation/cubit/cart_view_model.dart';

class ProductCartItem extends StatelessWidget {
  const ProductCartItem(
      {super.key, required this.viewModel, required this.index});
  final CartViewModel viewModel;

  // final CartResponseEntity? cartData;
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
                      .cartData?.data?.product[index].coverImageURL ??
                  'https://ecommerce.routemisr.com/Route-Academy-products/1680399913757-cover.jpeg',
              height: double.infinity,
              width: 120.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Container(
            padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
            width: 130.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 3,
                  '${viewModel.cartData?.data?.product[index].title}\n\n',
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
                  'EGP ${viewModel.cartData?.data?.product[index].price}',
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
                    onPressed: () {
                      viewModel.removeFromCart(
                          productId:
                              viewModel.cartData?.data?.product[index].id ??
                                  '');
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      size: 28.sp,
                    )),
                Container(
                  // width: 122.w,
                  // height: 44.h,
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
                        onPressed: () {
                          if ((viewModel.cartData?.data?.product[index].count ??
                                  1) >
                              1) {
                            viewModel.updateCart(
                                productId: viewModel
                                        .cartData?.data?.product[index].id ??
                                    '',
                                count: (viewModel.cartData?.data?.product[index]
                                            .count ??
                                        1) -
                                    1);
                          } else {
                            viewModel.removeFromCart(
                                productId: viewModel
                                        .cartData?.data?.product[index].id ??
                                    '');
                          }
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      // SizedBox(
                      //   width: 1.w,
                      // ),
                      Text(
                        viewModel.cartData?.data?.product[index].count
                                .toString() ??
                            '1',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 20.sp,
                              color: ColorManager.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      // SizedBox(
                      //   width: 5.w,
                      // ),
                      IconButton(
                        iconSize: 28.sp,
                        color: ColorManager.white,
                        onPressed: () {
                          viewModel.updateCart(
                              productId:
                                  viewModel.cartData?.data?.product[index].id ??
                                      '',
                              count: (viewModel.cartData?.data?.product[index]
                                          .count ??
                                      1) +
                                  1);
                        },
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
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
