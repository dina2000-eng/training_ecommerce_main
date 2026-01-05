import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_text_styles.dart';

class ListHeader extends StatelessWidget {

  final String title;
  final VoidCallback? onTap;
  final String description;

  const ListHeader({
    Key? key,
    required this.title,
    this.onTap,
    required this.description,}) : super(key: key);

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