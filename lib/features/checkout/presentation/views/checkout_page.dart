import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controllers/checkout/checkout_cubit.dart';
import '../../../../controllers/checkout/checkout_state.dart';
import '../../../../core/components/widgets/main_button.dart';
import '../../../../core/routes/routes.dart';
import '../../../../models/add_shipping_address_args.dart';
import '../../../../models/delivery_method.dart';
import '../../../../models/shipping_address.dart';
import '../../widgets/checkout_order_details.dart';
import '../../widgets/delivery_method_item.dart';
import '../../widgets/payment_component.dart';
import '../../widgets/shipping_address_component.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final checkoutCubit = BlocProvider.of<CheckoutCubit>(context);

    Widget shippingAddressComponent(ShippingAddress? shippingAddress) {
      if (shippingAddress == null) {
        return Center(
          child: Column(
            children: [
              const Text('No Shipping Addresses!'),
              6.verticalSizedBox,
              InkWell(
                onTap: () => Navigator.of(context).pushNamed(
                    Routes.addShippingAddressRoute,
                    arguments: AddShippingAddressArgs(
                      checkoutCubit: checkoutCubit,
                      shippingAddress: shippingAddress,
                    )
                ),
                child: Text(
                  'Add new one',
                  style: AppTextStyles.font14BlackWeight500.copyWith(
                    color: AppColors.redColor,
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        return ShippingAddressComponent(shippingAddress: shippingAddress, checkoutCubit: checkoutCubit,);
      }
    }

    Widget deliveryMethodsComponent(List<DeliveryMethod> deliveryMethods) {
      if (deliveryMethods.isEmpty) {
        return const Center(
          child: Text('No delivery methods available!'),
        );
      }
      return SizedBox(
        height: size.height * 0.13,
        child: ListView.builder(
          itemCount: deliveryMethods.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, i) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: DeliveryMethodItem(deliveryMethod: deliveryMethods[i]),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: AppTextStyles.font16BlackWeight400,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CheckoutCubit, CheckoutState>(
        bloc: checkoutCubit,
        buildWhen: (previous, current) =>
        current is CheckoutLoading ||
            current is CheckoutLoaded ||
            current is CheckoutLoadingFailed,
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is CheckoutLoadingFailed) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is CheckoutLoaded) {
            final shippingAddress = state.shippingAddress;
            final deliveryMethods = state.deliveryMethods;

            return Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipping address',
                      style: AppTextStyles.font24BlackWeight400,
                    ),
                    8.verticalSizedBox,
                    shippingAddressComponent(shippingAddress),
                    24.verticalSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment',
                          style: AppTextStyles.font24BlackWeight400,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(Routes.paymentMethodsRoute);
                          },
                          child: Text(
                            'Change',
                            style: AppTextStyles.font14BlackWeight500
                                .copyWith(
                              color: AppColors.redColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    8.verticalSizedBox,
                    const PaymentComponent(),
                    24.verticalSizedBox,
                    Text(
                      'Delivery method',
                      style: AppTextStyles.font24BlackWeight400,
                    ),
                    8.verticalSizedBox,
                    deliveryMethodsComponent(deliveryMethods),
                    32.verticalSizedBox,
                    const CheckoutOrderDetails(),
                    64.verticalSizedBox,
                    BlocConsumer<CheckoutCubit, CheckoutState>(
                      bloc: checkoutCubit,
                      listenWhen: (previous, current) =>
                      current is PaymentMakingFailed ||
                          current is PaymentMade,
                      listener: (context, state) {
                        if (state is PaymentMakingFailed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.error),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        } else if (state is PaymentMade) {
                          Navigator.of(context).popUntil(
                                (route) => route.isFirst,
                          );
                        }
                      },
                      buildWhen: (previous, current) =>
                      current is PaymentMade ||
                          current is PaymentMakingFailed ||
                          current is MakingPayment,
                      builder: (context, state) {
                        if (state is MakingPayment) {
                          return MainButton(
                            //hasCircularBorder: true,
                            child: const CircularProgressIndicator.adaptive(),
                          );
                        }
                        return MainButton(
                          title: 'Submit Order',
                          onTap: () async =>
                          await checkoutCubit.makePayment(300),
                          //hasCircularBorder: true,
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}