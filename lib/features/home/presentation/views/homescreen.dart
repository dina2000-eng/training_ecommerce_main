import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controllers/cart/cart_cubit.dart';
import '../../../../controllers/home/home_cubit.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../services/home_services.dart';
import '../../../cart/presenation/views/cart_page.dart';
import '../../../categories/presentation/views/categories_page.dart';
import '../../widget/BottomNavBar.dart';
import 'homepage.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int _selectedBottomIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(),
      CategoriesPage(),
      CartPage(),
      Center(child: Text("Favourite Page")),
      Center(child: Text("Profile Page")),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeCubit(
            HomeServicesImpl(FirebaseFirestore.instance),
          )..getHomeData(),
        ),
        BlocProvider(
          create: (_) => CartCubit()..getCartItems(),
        ),
      ],
      child: Scaffold(
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
      ),
    );

  }
}
