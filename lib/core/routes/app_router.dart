import 'package:ecommerce/features/auth/presentation/views/forgot_password_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/checkout/checkout_cubit.dart';
import '../../controllers/product_details/product_details_cubit.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/checkout/presentation/views/add_shipping_address_page.dart';
import '../../features/checkout/presentation/views/checkout_page.dart';
import '../../features/checkout/presentation/views/payment_methods_page.dart';
import '../../features/checkout/presentation/views/shipping_addresses_page.dart';
import '../../features/home/presentation/product_details.dart';
import '../../features/home/presentation/views/homescreen.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/categories/presentation/views/categories_page.dart';
import '../../models/add_shipping_address_args.dart';
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
      case Routes.checkoutPageRoute:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = CheckoutCubit();
              cubit.getCheckoutData();
              return cubit;
            },
            child: const CheckoutPage(),
          ),
          settings: settings,
        );

      case Routes.shippingAddressesRoute:
        final checkoutCubit = settings.arguments as CheckoutCubit;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: checkoutCubit,
            child: const ShippingAddressesPage(),
          ),
          settings: settings,
        );
      case Routes.paymentMethodsRoute:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = CheckoutCubit();
              cubit.fetchCards();
              return cubit;
            },
            child: const PaymentMethodsPage(),
          ),
          settings: settings,
        );
      case Routes.addShippingAddressRoute:
        final args = settings.arguments as AddShippingAddressArgs;
        final checkoutCubit = args.checkoutCubit;
        final shippingAddress = args.shippingAddress;

        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: checkoutCubit,
            child: AddShippingAddressPage(
              shippingAddress: shippingAddress,
            ),
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }
  }
}
