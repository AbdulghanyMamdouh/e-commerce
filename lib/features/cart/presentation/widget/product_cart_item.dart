import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/di/di.dart';
import 'package:shopping_app/core/theme/color_manager.dart';
import 'package:shopping_app/features/cart/domain/entity/cart_response_entity.dart';
import 'package:shopping_app/features/cart/presentation/cubit/cart_view_model.dart';

class ProductCartItem extends StatelessWidget {
  ProductCartItem({super.key, required this.cartData, required this.index});
  final CartViewModel viewModel =
      CartViewModel(cartUseCase: injectCartUseCase());
  CartResponseEntity? cartData;
  int index = 0;
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
              imageUrl: cartData?.data?.product[index].coverImageURL ??
                  'https://ecommerce.routemisr.com/Route-Academy-products/1680399913757-cover.jpeg',
              height: double.infinity,
              width: 120.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          SizedBox(
            width: 140.w,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${cartData?.data?.product[index].title}\n\n',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ColorManager.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          height: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                  TextSpan(
                    text: 'EGP ${cartData?.data?.product[index].price}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ColorManager.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                  ),
                ],
              ),
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
                      onPressed: () {
                        viewModel.removeFromCart(
                            productId: cartData?.data?.product[index].id ?? '');
                      },
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
                        // SizedBox(
                        //   width: 8.w,
                        // ),
                        Text(
                          cartData?.data?.product[index].count.toString() ??
                              '1',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 20.sp,
                                    color: ColorManager.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                          width: 5.w,
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
