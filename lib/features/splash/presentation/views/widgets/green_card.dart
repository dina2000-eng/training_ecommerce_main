import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class GreenCard extends StatelessWidget {
  const GreenCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: 20.allBorderRadius,
        color: AppColors.primaryColor,
      ),
    );
  }
}
