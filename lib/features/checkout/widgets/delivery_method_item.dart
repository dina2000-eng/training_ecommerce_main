import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../../../models/delivery_method.dart';

class DeliveryMethodItem extends StatelessWidget {
  final DeliveryMethod deliveryMethod;
  const DeliveryMethodItem({
    Key? key,
    required this.deliveryMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          deliveryMethod.imgUrl.isNotEmpty
              ? Image.asset(
            deliveryMethod.imgUrl,
            height: 30,
            fit: BoxFit.contain,
          )
              : Icon(
            Icons.local_shipping,
            size: 30,
            color: AppColors.grayColor,
          ),
          6.verticalSizedBox,
          Text(
            '${deliveryMethod.days} days',
            style: AppTextStyles.font24BlackWeight400,
          ),
        ]),
      ),
    );
  }
}