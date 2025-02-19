import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/color_manager.dart';
import 'package:shopping_app/core/utils/validator.dart';
import 'package:shopping_app/core/widgets/default_text_field.dart';
import 'package:shopping_app/features/auth/presentation/screens/register/register_screen.dart';
import 'package:shopping_app/features/auth/presentation/widgets/default_elevated_button.dart';
import 'package:shopping_app/features/auth/presentation/widgets/default_text_button.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'RegisterScreen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
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
                  bottom: 46.9.h,
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
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Full Name ',
                            style: titleMediumStyle?.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 24.h),
                          DefaultTextField(
                            controller: _nameController,
                            hintText: 'Enter Your Full Name',
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (!Validator.isName(value)) {
                                return 'Please enter a valid name.\natleast 2 char';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            'Mobile Number',
                            style: titleMediumStyle?.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 24.h),
                          DefaultTextField(
                            controller: _mobileController,
                            hintText: 'Enter Your Mobile Number',
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (!Validator.isPhoneEg(value)) {
                                return 'Please enter a valid phone number,only eg.';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 24.h),
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
                          SizedBox(height: 56.h),
                          DefaultElevatedButton(
                            onPressed: () {
                              _signup();
                            },
                            label: 'sign up',
                          ),
                          SizedBox(height: 68.h),
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

  void _signup() {
    if (_formKey.currentState!.validate()) {}
  }
}
