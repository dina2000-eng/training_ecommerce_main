import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controllers/home/home_cubit.dart';
import '../../../../controllers/home/home_state.dart';
import '../../../../controllers/product_details/product_details_cubit.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/app_assets.dart';
import '../../widget/saleproduct.dart';
import '../../../../models/product.dart';
import '../product_details.dart';

Widget buildNewProduct(Product product) {
  return Container(
    margin: const EdgeInsets.only(right: 12.0),
    width: 140,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            product.imgUrl,
            width: 140,
            height: 140,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product.title,
          style: AppTextStyles.font14BlackWeight500,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '\$${product.price}',
          style: AppTextStyles.font11GrayWeight400,
        ),
      ],
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is HomeFailed) {
          return Center(child: Text(state.error));
        }
        if (state is HomeSuccess) {
          return SizedBox.expand(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 260,
                    child: Stack(
                      children: [
                        Image.asset(
                          AppAssets.imagesMainpage,
                          width: double.infinity,
                          height: 260,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: 16,
                          top: 200,
                          child: Text(
                            "Street clothes",
                            style: AppTextStyles.font34WhiteWeight900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  37.verticalSizedBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Sale", style: AppTextStyles.font34BlackWeight700),
                            const Spacer(),
                            TextButton(onPressed: () {}, child: const Text("View all")),
                          ],
                        ),
                        const Text("Super summer sale"),
                        22.verticalSizedBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: state.salesProducts.map((product) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => BlocProvider(
                                        create: (_) => ProductDetailsCubit(),
                                        child: ProductDetails(product: product,),
                                      ),
                                    ),
                                  );
                                },
                                child: SaleProductItem(
                                  imgUrl: product.imgUrl,
                                  title: product.title,
                                  category: product.category,
                                  price: product.price,
                                  rate: product.rate,
                                  discountValue: product.discountValue,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  40.verticalSizedBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("New", style: AppTextStyles.font34BlackWeight700),
                            const Spacer(),
                            TextButton(onPressed: () {}, child: const Text("View all")),
                          ],
                        ),
                        const Text("You’ve never seen it before!"),
                        22.verticalSizedBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: state.newProducts.map((product) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => BlocProvider(
                                        create: (_) => ProductDetailsCubit(),
                                        child: ProductDetails(product: product,),
                                      ),
                                    ),
                                  );
                                },
                                child: buildNewProduct(product),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
