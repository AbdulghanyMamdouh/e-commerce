import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/color_manager.dart';
import 'package:shopping_app/core/widgets/default_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final titleMediumStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 91.h,
                  bottom: 87.h,
                  left: 97.w,
                  right: 97.w,
                ),
                child: Image.asset(
                  'assets/images/route.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Welcome Back To Route',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      'Please sign in with your email',
                      style: titleMediumStyle?.copyWith(fontSize: 16.sp),
                    ),
                    SizedBox(height: 40.h),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: titleMediumStyle?.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 24.h),
                          DefaultTextField(
                            controller: _emailController,
                            hintText: 'Enter Your Email',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            'Password',
                            style: titleMediumStyle?.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 24.h),
                          DefaultTextField(
                            controller: _passwordController,
                            hintText: 'Enter Your Password',
                            keyboardType: TextInputType.visiblePassword,
                            isPassword: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
