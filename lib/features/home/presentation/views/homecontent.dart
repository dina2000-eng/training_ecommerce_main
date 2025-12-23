import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/app_assets.dart';
import '../../widget/newproduct.dart';
import '../../widget/saleproduct.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  ClipRRect(
                    child: Image.asset(
                      AppAssets.imagesMainpage,
                      width: double.infinity,
                      height: 260,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 200,
                    child: Text(
                      "Street clothes",
                      style: AppTextStyles.font34WhiteWeight900.copyWith(height: 1.1),
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
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text("View all", style: AppTextStyles.font11BlackWeight400),
                      ),
                    ],
                  ),
                  4.horizontalSizedBox,
                  Text("Super summer sale", style: AppTextStyles.font11GrayWeight400),
                  22.verticalSizedBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SaleProductItem(
                          image: AppAssets.imagesClothe1,
                          brand: "Dorothy Perkins",
                          title: "Evening Dress",
                          oldPrice: 15,
                          newPrice: 12,
                          discount: 20,
                        ),
                        SaleProductItem(
                          image: AppAssets.imagesClothe2,
                          brand: "Stilly",
                          title: "Sport Dress",
                          oldPrice: 22,
                          newPrice: 19,
                          discount: 15,
                        ),
                        SaleProductItem(
                          image: AppAssets.imagesClothe1,
                          brand: "Dorothy Perkins",
                          title: "Summer Dress",
                          oldPrice: 14,
                          newPrice: 11,
                          discount: 20,
                        ),
                      ],
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
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text("View all", style: AppTextStyles.font11BlackWeight400),
                      ),
                    ],
                  ),
                  4.horizontalSizedBox,
                  Text("You’ve never seen it before!", style: AppTextStyles.font11GrayWeight400),
                  22.verticalSizedBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildNewProduct(AppAssets.imagesClothe1),
                        buildNewProduct(AppAssets.imagesClothe2),
                        buildNewProduct(AppAssets.imagesClothe2),
                        buildNewProduct(AppAssets.imagesClothe1),
                      ],
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
}