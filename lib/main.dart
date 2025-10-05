import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/app_bloc_observer.dart';
import 'package:shopping_app/core/di/di.dart';
import 'package:shopping_app/core/utils/shared_preference_utils.dart';
import 'package:shopping_app/ecommerce.dart';
import 'package:shopping_app/features/auth/presentation/screens/login/login_screen.dart';
import 'package:shopping_app/features/cart/presentation/cubit/cart_view_model.dart';
import 'package:shopping_app/features/favorite/presentation/cubit/favorite_view_model.dart';
import 'package:shopping_app/features/home/presentation/cubit/home_view_model.dart';
import 'package:shopping_app/features/home/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await SharedPreferenceUtils.init();
  var token = SharedPreferenceUtils.getData(key: 'token');

  String? initialRoute;
  if (token == null) {
    initialRoute = LoginScreen.routeName;
  } else {
    initialRoute = HomeScreen.routeName;
  }
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) {
          return HomeViewModel(useCase: injectHomeUseCase());
        },
      ),
      BlocProvider(
        create: (context) {
          return CartViewModel(cartUseCase: injectCartUseCase());
        },
      ),
      BlocProvider(
        create: (context) {
          return FavoriteViewModel(favoriteUseCase: injectFavoriteUseCase());
        },
      ),
    ],
    child: EcommerceApp(
      initialRoute: initialRoute,
    ),
  ));
}
