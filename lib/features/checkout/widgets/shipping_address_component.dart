import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../controllers/checkout/checkout_cubit.dart';
import '../../../core/routes/routes.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/shipping_address.dart';

class ShippingAddressComponent extends StatelessWidget {
  final ShippingAddress shippingAddress;
  final CheckoutCubit checkoutCubit;
  const ShippingAddressComponent({
    super.key,
    required this.shippingAddress,
    required this.checkoutCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  shippingAddress.fullName,
                  style: AppTextStyles.font16BlackWeight400.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                    Routes.shippingAddressesRoute,
                    arguments: checkoutCubit,
                  ),
                  child: Text(
                    'Change',
                    style: AppTextStyles.font14BlackWeight500.copyWith(
                      color: AppColors.redColor,
                    ),
                  ),
                ),
              ],
            ),
            8.verticalSizedBox,
            Text(
              shippingAddress.address,
              style: AppTextStyles.font16BlackWeight400,
            ),
            Text(
              '${shippingAddress.city}, ${shippingAddress.state}, ${shippingAddress.country}',
              style: AppTextStyles.font16BlackWeight400,
            ),
          ],
        ),
      ),
    );
  }
}