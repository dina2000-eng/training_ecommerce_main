import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.controller,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.obscureText = false,

  });
  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: AppColors.blackColor,
      style: AppTextStyles.font14DarkGrayWeight500,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.font14GrayWeight500,
        fillColor: AppColors.whiteColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: 4.allBorderRadius,
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: 4.allBorderRadius,
          borderSide: BorderSide(color: AppColors.errorColor, width: 1),
        ),
      ),
    );
  }
}
