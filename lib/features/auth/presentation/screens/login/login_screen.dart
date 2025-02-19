import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/utils/validator.dart';
import 'package:shopping_app/core/widgets/default_text_field.dart';
import 'package:shopping_app/features/auth/presentation/screens/register/register_screen.dart';
import 'package:shopping_app/features/auth/presentation/widgets/default_elevated_button.dart';
import 'package:shopping_app/features/auth/presentation/widgets/default_text_button.dart';
import 'package:shopping_app/features/home/presentation/screens/home_screen.dart';

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
      resizeToAvoidBottomInset: true,
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
                            validator: (value) {
                              if (!Validator.isEmail(value)) {
                                return 'Please enter a valid email address.';
                              }
                              return null;
                            },
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
                            validator: (value) {
                              if (!Validator.isPassowrd(value)) {
                                return '''
 8 characters long,
 1 uppercase & 1 lowercase character,
 1 special character.
                                ''';
                              }
                              return null;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DefaultTextButton(
                                onPressed: () {},
                                label: 'forget password?',
                              ),
                            ],
                          ),
                          SizedBox(height: 56.h),
                          DefaultElevatedButton(
                            onPressed: () {
                              _login();
                            },
                            label: 'login',
                          ),
                          SizedBox(height: 32.h),
                          Center(
                            child: DefaultTextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RegisterScreen.routeName);
                              },
                              label: 'Don’t have an account? Create Account',
                            ),
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

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, HomeScreen.routeName);
    }
  }
}
