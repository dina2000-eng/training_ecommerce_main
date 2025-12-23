import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:ecommerce/generated/app_assets.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'categoryitem.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final int selectedBottomIndex = 0;
  int selectedCategoryIndex = 0;
  final List<String> categories = ['Women', 'Men', 'Kids'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Categories",
          style: AppTextStyles.font18BlackWeight400,
        ),
        centerTitle: true,
        shadowColor: AppColors.grayColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 44,
              color: AppColors.whiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(categories.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          categories[index],
                          style: AppTextStyles.font16BlackWeight400.copyWith(
                            color: selectedCategoryIndex == index
                                ? AppColors.blackColor
                                : AppColors.blackColor,
                          ),
                        ),
                        6.verticalSizedBox,
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width:
                          selectedCategoryIndex == index ? 50 : 0,
                          height: 3,
                          color: AppColors.redColor,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            16.verticalSizedBox,
            Container(
              padding: 16.vPadding,
              width: 343,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.redColor,
                borderRadius: 8.allBorderRadius,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('SUMMER SALES', style: AppTextStyles.font24BlackWeight400,
                  ),
                  2.verticalSizedBox,
                  Text('Up to 50% off', style: AppTextStyles.font14WhiteWeight500,
                  ),
                ],
              ),
            ).center(),
            16.verticalSizedBox,
            Column(
              children: [
                Categoryitem(
                  title: "New",
                  image: AppAssets.imagesNew,
                ),
                16.verticalSizedBox,
                Categoryitem(
                  title: "Clothes",
                  image: AppAssets.imagesClothes,
                ),
                16.verticalSizedBox,
                Categoryitem(
                  title: "Shoes",
                  image: AppAssets.imagesShoes,
                ),
                16.verticalSizedBox,
                Categoryitem(
                  title: "Accesories",
                  image: AppAssets.imagesAccesories,
                ),
              ],
            ).center(),
          ],
        ),
      ),
    );
  }
}
