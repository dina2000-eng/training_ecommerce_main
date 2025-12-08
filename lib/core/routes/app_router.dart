import 'package:ecommerce/features/auth/presentation/views/forgot_password_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
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
      default:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }
  }
}
