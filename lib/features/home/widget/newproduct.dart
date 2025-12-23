import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/theme/app_colors.dart';

Widget buildNewProduct(String imagePath) {
  return Container(
    width: 150,
    height: 218,
    margin: EdgeInsets.only(right: 16),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 150,
            height: 218,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.blackColor,
              borderRadius: 29.allBorderRadius,
            ),
            child: Text(
              "NEW",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}