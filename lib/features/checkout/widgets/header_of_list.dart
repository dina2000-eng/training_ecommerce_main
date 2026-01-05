import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderOfList extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final String description;
  const HeaderOfList({
    Key? key,
    required this.title,
    required this.description,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.font24BlackWeight400.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
            InkWell(
              onTap: onTap,
              child: Text(
                'View All',
                style: AppTextStyles.font16BlackWeight400,
              ),
            ),
          ],
        ),
        Text(
          description,
          style: AppTextStyles.font16BlackWeight400.copyWith(
            color: AppColors.grayColor,
          ),
        ),
      ],
    );
  }
}