import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.controller,
    this.textInputAction,
    this.validator,
    this.obscureText = false,
  });

  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool? isValid; // null / true / false

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: widget.obscureText,
      onChanged: (value) {
        if (widget.validator == null) return;

        final result = widget.validator!(value);
        setState(() {
          isValid = value.isEmpty ? null : result == null;
        });
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: AppColors.whiteColor,

        suffixIcon: isValid == null
            ? null
            : Icon(
          isValid! ? Icons.check_circle : Icons.close,
          color: isValid! ? Colors.green : Colors.red,
        ),

        enabledBorder: _borderColor(),
        focusedBorder: _borderColor(),
      ),
    );
  }

  OutlineInputBorder _borderColor() {
    Color color = Colors.grey;

    if (isValid == true) color = Colors.green;
    if (isValid == false) color = Colors.red;

    return OutlineInputBorder(
      borderRadius: 4.allBorderRadius,
      borderSide: BorderSide(color: color, width: 1),
    );
  }
}


