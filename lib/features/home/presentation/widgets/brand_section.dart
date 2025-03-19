import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/di/di.dart';
import 'package:shopping_app/core/utils/loading_indicator.dart';
import 'package:shopping_app/features/home/presentation/cubit/home_states.dart';
import 'package:shopping_app/features/home/presentation/cubit/home_view_model.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_brand_item.dart';

class BrandSection extends StatelessWidget {
  const BrandSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          HomeViewModel(useCase: injectHomeUseCase())..getAllBrands(),
      child: SizedBox(
        height: 286.h,
        child: BlocBuilder<HomeViewModel, HomeStates>(
          builder: (context, state) {
            if (state is GetBrandLoadingState) {
              return const LoadingIndicator();
            } else if (state is GetBrandSuccessState) {
              return GridView.builder(
                  itemCount: state.brands.length,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.w,
                    crossAxisSpacing: 16.h,
                    mainAxisExtent: 100.h,
                    childAspectRatio: 100 / 144,
                  ),
                  itemBuilder: (_, index) {
                    return CustomBrandItem(brand: state.brands[index]);
                  });
            } else if (state is GetBrandErrorState) {
              return Text(state.errorMessage);
            } else {
              return const Text('no data available');
            }
          },
        ),
      ),
    );
  }
}
