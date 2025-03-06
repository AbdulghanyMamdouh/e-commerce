import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/di/di.dart';
import 'package:shopping_app/core/utils/custom_dialog.dart';
import 'package:shopping_app/core/utils/shared_preference_utils.dart';
import 'package:shopping_app/core/utils/validator.dart';
import 'package:shopping_app/core/widgets/default_text_field.dart';
import 'package:shopping_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:shopping_app/features/auth/presentation/cubit/auth_view_model.dart';
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
  AuthViewModel authViewModel = AuthViewModel(authUseCase: injectUseCase());

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
                      key: authViewModel.formKey,
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
                            controller: authViewModel.emailController,
                            hintText: 'Enter Your Email',
                            keyboardType: TextInputType.emailAddress,
                            autoValidate: false,
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
                            controller: authViewModel.passwordController,
                            hintText: 'Enter Your Password',
                            keyboardType: TextInputType.visiblePassword,
                            isPassword: true,
                            autoValidate: false,
                            validator: (value) {
                              if (!Validator.isPassowrd(value)) {
                                return 'invalid password!.';
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
                          BlocListener(
                            bloc: authViewModel,
                            listener: (context, state) {
                              if (state is LoginStateLoading) {
                                //todo: show loading
                                CustomDialog.showLoading(context);
                              } else if (state is LoginStateSuccess) {
                                //todo: hide loading
                                //navigate to home
                                CustomDialog.hideLoading(context);
                                //todo: save token
                                SharedPreferenceUtils.saveData(
                                  key: 'token',
                                  value: state.authResultEntity.token,
                                );
                                //todo: go to home
                                Navigator.of(context)
                                    .pushNamed(HomeScreen.routeName);
                              } else if (state is LoginStateError) {
                                CustomDialog.hideLoading(context);
                                CustomDialog.showMessage(
                                    state.errorMessage ??= 'some error');
                              }
                            },
                            child: DefaultElevatedButton(
                              onPressed: () {
                                authViewModel.login();
                              },
                              label: 'login',
                            ),
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
}
