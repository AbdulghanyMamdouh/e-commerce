import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/color_manager.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField({
    required this.hintText,
    this.suffixIcon,
    this.validator,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.maxLength,
  });
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool isPassword;
  final int? maxLength;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: ColorManager.white,
        filled: true,
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () => setState(() => isObscure = !isObscure),
                icon: isObscure
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorManager.blueGrey),
          borderRadius: BorderRadius.circular(15.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorManager.blueGrey),
          borderRadius: BorderRadius.circular(15.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorManager.red),
          borderRadius: BorderRadius.circular(15.r),
        ),
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: ColorManager.textColor,
            ),
      ),
      style: const TextStyle(
        color: ColorManager.black,
      ),
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isPassword ? isObscure : false,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
    );
  }
}
