import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrderSummaryComponent extends StatelessWidget {
  final String title;
  final String value;
  const OrderSummaryComponent({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title:',
          style: AppTextStyles.font16BlackWeight400.copyWith(
            color: AppColors.grayColor,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.font16BlackWeight400,
        ),
      ],
    );
  }
}