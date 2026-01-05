import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controllers/cart/cart_cubit.dart';
import '../../../../controllers/cart/cart_state.dart';
import '../../../../core/components/widgets/main_button.dart';
import '../../../../core/routes/routes.dart';
import '../../widgets/cart_list_item.dart';
import '../../widgets/order_summary_component.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CartCubit, CartState>(
        buildWhen: (previous, current) =>
        current is CartLoaded ||
            current is CartLoading ||
            current is CartError,
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is CartError) {
            return Center(
              child: Text(
                state.message,
                style: AppTextStyles.font14BlackWeight500,
              ),
            );
          }
          if (state is CartLoaded) {
            final totalAmount = state.totalAmount;
            final cartProducts = state.cartProducts;

            return RefreshIndicator(
              onRefresh: () async {
                await context.read<CartCubit>().getCartItems();
              },
              child: ListView(
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox.shrink(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                    ],
                  ),
                  16.verticalSizedBox,
                  Text(
                    'My Cart',
                    style: AppTextStyles.font24BlackWeight400.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ),
                  16.verticalSizedBox,
                  if (cartProducts.isEmpty)
                    Center(
                      child: Text(
                        'No Data Available!',
                        style: AppTextStyles.font16BlackWeight400,
                      ),
                    ),

                  if (cartProducts.isNotEmpty)
                    ListView.builder(
                      itemCount: cartProducts.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CartListItem(
                          cartItem: cartProducts[index],
                        );
                      },
                    ),
                  24.verticalSizedBox,
                  OrderSummaryComponent(
                    title: 'Total Amount',
                    value: totalAmount.toString(),
                  ),
                  32.verticalSizedBox,
                  MainButton(
                    title: 'Checkout',
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(Routes.checkoutPageRoute);
                    },
                  ),
                  32.verticalSizedBox,
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
