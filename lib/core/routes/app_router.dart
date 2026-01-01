import 'package:ecommerce/features/auth/presentation/views/forgot_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/product_details/product_details_cubit.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/home/presentation/product_details.dart';
import '../../features/home/presentation/views/homescreen.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/categories/presentation/views/categories_page.dart';
import '../../models/product.dart';
import 'routes.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.signup:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordView(),
        );
      case Routes.categories:
        return MaterialPageRoute(builder: (context) =>  CategoriesPage());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) =>  homeScreen());
      case Routes.productDetails:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => ProductDetailsCubit(),
            child: ProductDetails(product: product),
          ),
        );

      default:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }
  }
}
