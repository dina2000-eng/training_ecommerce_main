import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../home/widget/BottomNavBar.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int _selectedBottomIndex = 0;

  final List<Widget> _pages = [
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 44,
            color: AppColors.whiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Women', style: AppTextStyles.font16BlackWeight400),
                SizedBox(width: 50,),
                Text('Men', style: AppTextStyles.font16BlackWeight400),
                SizedBox(width: 50,),
                Text('Kids', style: AppTextStyles.font16BlackWeight400),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Summer Sales Box
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
                Text('SUMMER SALES', style: AppTextStyles.font24BlackWeight400),
                SizedBox(height: 2),
                Text('Up to 50% off', style: AppTextStyles.font14WhiteWeight500),
              ],
            ),
          ).center(),
          SizedBox(height: 16),
          Column(
            children: [
              Container(
                width: 343,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: 8.allBorderRadius,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "New",
                          style: AppTextStyles.font18BlackWeight400,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      child: Image.asset(
                        "assets/images/new.png",
                        width: 171,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                ),
              SizedBox(height: 16,),
              Container(
                width: 343,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: 8.allBorderRadius,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Clothes",
                          style: AppTextStyles.font18BlackWeight400,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      child: Image.asset(
                        "assets/images/clothes.png",
                        width: 171,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Container(
                width: 343,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: 8.allBorderRadius,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Shoes",
                          style: AppTextStyles.font18BlackWeight400,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      child: Image.asset(
                        "assets/images/shoes.png",
                        width: 171,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Container(
                width: 343,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: 8.allBorderRadius,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Accesories",
                          style: AppTextStyles.font18BlackWeight400,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      child: Image.asset(
                        "assets/images/accesories.png",
                        width: 171,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ).center(),
        ],
      ),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text("Categories", style: AppTextStyles.font18BlackWeight400),
        centerTitle: true,
        shadowColor: AppColors.grayColor,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: _pages[_selectedBottomIndex],
    );
  }
}
