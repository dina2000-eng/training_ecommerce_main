import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/app_colors.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedBottomIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.selectedBottomIndex,
    required this.onTap,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      height: 83,
      child: BottomNavigationBar(
        currentIndex: widget.selectedBottomIndex,
        onTap: widget.onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.redColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home, color: AppColors.redColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart, color: AppColors.redColor),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag, color: AppColors.redColor),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite, color: AppColors.redColor),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            activeIcon: Icon(Icons.person, color: AppColors.redColor),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
