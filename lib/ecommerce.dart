import 'package:flutter/material.dart';
import 'package:shopping_app/core/theme/theme_manager.dart';
import 'package:shopping_app/features/auth/presentation/screens/login/login_screen.dart';
import 'package:shopping_app/features/auth/presentation/screens/register/register_screen.dart';
import 'package:shopping_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'For you',
        theme: ThemeManager.mainTheme,
        routes: {
          HomeScreen.routeName: (_) => const HomeScreen(),
          LoginScreen.routeName: (_) => const LoginScreen(),
          RegisterScreen.routeName: (_) => const RegisterScreen(),
        },
        initialRoute: LoginScreen.routeName,
      ),
    );
  }
}
