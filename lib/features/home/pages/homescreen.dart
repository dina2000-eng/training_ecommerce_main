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
            height: 536,
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    "assets/images/mainpage.png",
                    width: double.infinity,
                    height: 536,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 354,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fashion\nsale",
                        style: AppTextStyles.font48WhiteWeight900
                            .copyWith(height: 1.1),
                      ),
                      SizedBox(height: 18),
                      Container(
                        width: 160,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.redColor,
                          borderRadius: 25.allBorderRadius,
                        ),
                        child: Text(
                          "Check",
                          style: AppTextStyles.font14WhiteWeight500,
                        ).center(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 33),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "New",
                      style: AppTextStyles.font34BlackWeight700,
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "view all",
                        style: AppTextStyles.font11BlackWeight400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  "You’ve never seen it before!",
                  style: AppTextStyles.font11GrayWeight400,
                ),
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
}

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
