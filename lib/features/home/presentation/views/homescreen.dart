import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../categories/presentation/views/categories_page.dart';
import '../../widget/BottomNavBar.dart';
import 'homecontent.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int _selectedBottomIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
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
