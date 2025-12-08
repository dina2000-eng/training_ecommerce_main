import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/features/auth/presentation/views/widgets/login_form.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import 'widgets/social_media_buttons.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSizedBox,
            Text("Login", style: AppTextStyles.font34BlackWeight700),
            73.verticalSizedBox,
            LoginForm(),
            150.verticalSizedBox,
            SocialMediaButtons(),
          ],
        ).horizontalPadding(16),
      ),
    );
  }
}
