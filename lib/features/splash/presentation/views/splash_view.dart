import 'package:ecommerce/core/extensions/app_extentions.dart';

import 'package:ecommerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
    ).then((value) => context.pushNamed(Routes.signup));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text(
          "Splash View",
          style: AppTextStyles.font34BlackWeight700,
        ).center(),
      ),
    );
  }
}
