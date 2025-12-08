import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/widgets.dart';

abstract class AppTextStyles {
  static const font34BlackWeight700 = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );
  static const font11GrayWeight400 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.grayColor,
  );
  static const font14DarkGrayWeight500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGrayColor,
  );
  static const font14GrayWeight500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.grayColor,
  );
  static const font14BlackWeight500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
  static const font14WhiteWeight500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static const font11ErrorWeight400 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.errorColor,
  );
}
