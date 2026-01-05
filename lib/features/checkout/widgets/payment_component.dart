import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../generated/app_assets.dart';

class PaymentComponent extends StatelessWidget {
  const PaymentComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
              color: AppColors.whiteColor, borderRadius: BorderRadius.circular(16.0)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.network(
              AppAssets.mastercardIcon,
              fit: BoxFit.cover,
              height: 30,
            ),
          ),
        ),
        16.verticalSizedBox,
        Text('**** **** **** 2718'),
      ],
    );
  }
}