import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class Categoryitem extends StatelessWidget {
  const Categoryitem({
    super.key, required this.image, required this.title,
  });
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: 8.allBorderRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.1),
            blurRadius: 14,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: AppTextStyles.font18BlackWeight400,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            child: Image.asset(
              image,
              width: 171,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      );
  }
}