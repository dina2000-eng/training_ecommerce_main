import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controllers/product_details/product_details_cubit.dart';
import '../../../controllers/product_details/product_details_state.dart';
import '../../../core/components/widgets/main_button.dart';
import '../../../core/theme/app_colors.dart';
import '../../../generated/app_assets.dart';
import '../../../models/product.dart';
import '../widget/drop_down_menu.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  const ProductDetails({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productDetailsCubit = context.read<ProductDetailsCubit>();
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              AppAssets.imagesClothe1,
              width: double.infinity,
              height: size.height * 0.55,
              fit: BoxFit.cover,
            ),
            8.verticalSizedBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          child: DropDownMenuComponent(
                            items: const ['S', 'M', 'L', 'XL', 'XXL'],
                            hint: 'Size',
                            onChanged: (value) {
                              productDetailsCubit.setSize(value!);
                            },
                          ),
                        ),
                      ),
                      12.verticalSizedBox,
                      Material(
                        color: Colors.transparent,
                        shape: const CircleBorder(),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.whiteColor,
                            ),
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color:
                              isFavorite ? AppColors.redColor : AppColors.blackColor,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  24.verticalSizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '\$${product.price}',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  8.verticalSizedBox,
                  Text(
                    product.category,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: AppColors.blackColor),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'This is a dummy description for this product!',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
                    listenWhen: (previous, current) =>
                    current is AddedToCart ||
                        current is AddToCartError,
                    listener: (context, state) {
                      if (state is AddedToCart) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Product added to the cart!'),
                          ),
                        );
                      }
                      if (state is AddToCartError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.error)),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is AddingToCart) {
                        return const MainButton(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      return MainButton(
                        title: 'Add to cart',
                        onTap: () async {
                          await productDetailsCubit.addToCart(product);
                        },
                      );
                    },
                  ),
                  32.verticalSizedBox,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
