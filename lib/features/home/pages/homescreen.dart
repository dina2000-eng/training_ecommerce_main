import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../categories/pages/categories_page.dart';
import '../widget/BottomNavBar.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 260,
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    "assets/images/mainpage.png",
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
                SizedBox(height: 22),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildSaleProduct(
                        image: "assets/images/clothe1.png",
                        brand: "Dorothy Perkins",
                        title: "Evening Dress",
                        oldPrice: 15,
                        newPrice: 12,
                        discount: 20,
                      ),
                      buildSaleProduct(
                        image: "assets/images/clothe2.png",
                        brand: "Stilly",
                        title: "Sport Dress",
                        oldPrice: 22,
                        newPrice: 19,
                        discount: 15,
                      ),
                      buildSaleProduct(
                        image: "assets/images/clothe1.png",
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
                SizedBox(height: 22),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildNewProduct("assets/images/clothe1.png"),
                      _buildNewProduct("assets/images/clothe2.png"),
                      _buildNewProduct("assets/images/clothe2.png"),
                      _buildNewProduct("assets/images/clothe1.png"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildNewProduct(String imagePath) {
    return Container(
      width: 160,
      height: 100,
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 160,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: 29.allBorderRadius,
              ),
              child: Text(
                "NEW",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildSaleProduct({
    required String image,
    required String brand,
    required String title,
    required int oldPrice,
    required int newPrice,
    required int discount,
  }) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  width: 160,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.redColor,
                    borderRadius: 20.allBorderRadius,
                  ),
                  child: Text(
                    "-$discount%",
                    style: AppTextStyles.font11WhiteWeight400,
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(blurRadius: 4, color: AppColors.blackColor),
                    ],
                  ),
                  child: Icon(Icons.favorite_border, size: 18),
                ),
              ),
            ],
          ),

          SizedBox(height: 6),

          Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 16),
              Icon(Icons.star, color: Colors.orange, size: 16),
              Icon(Icons.star, color: Colors.orange, size: 16),
              Icon(Icons.star, color: Colors.orange, size: 16),
              Icon(Icons.star_half, color: Colors.orange, size: 16),
              SizedBox(width: 4),
              Text("(10)", style: AppTextStyles.font10GrayWeight400),
            ],
          ),

          4.verticalSizedBox,
          Text(brand, style: AppTextStyles.font11GrayWeight400),
          Text(title, style: AppTextStyles.font16BlackWeight400),

          3.verticalSizedBox,
          Row(
            children: [
              Text(
                "$oldPrice\$",
                style: AppTextStyles.font14GrayWeight500
              ),
              SizedBox(width: 6),
              Text(
                "$newPrice\$",
                style: AppTextStyles.font14RedWeight500
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/* ---------------------- Bottom Navigation ---------------------- */

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedBottomIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    CategoriesPage(),
    Center(child: Text("Bag Page")),
    Center(child: Text("Favourite Page")),
    Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: _pages[_selectedBottomIndex],
      bottomNavigationBar: BottomNavBar(
        selectedBottomIndex: _selectedBottomIndex,
        onTap: (index) {
          setState(() {
            _selectedBottomIndex = index;
          });
        },
      ),
    );
  }
}
