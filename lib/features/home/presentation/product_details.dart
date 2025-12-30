import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controllers/product_details/product_details_cubit.dart';
import '../../../core/components/widgets/main_button.dart';
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
  late String dropdownValue;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isFavorite = false;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              widget.product.imgUrl,
              width: double.infinity,
              height: size.height * 0.55,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropDownMenuComponent(
                          items: const ['S','M','L','XL','XXL'],
                          hint: 'Size',
                          onChanged: (value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? AppColors.redColor : AppColors.blackColor,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  24.verticalSizedBox,
                  Text(widget.product.title, style: AppTextStyles.font24BlackWeight400),
                  Text('\$${widget.product.price}', style: AppTextStyles.font18BlackWeight400),
                  const SizedBox(height: 16),
                  MainButton(
                    title: 'Add to Cart',
                      onTap: () => context.read<ProductDetailsCubit>().addToCart(widget.product)

                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}