import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import 'widgets/sign_up_form.dart';
import 'widgets/social_media_buttons.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            100.verticalSizedBox,
            Text("Sign up", style: AppTextStyles.font34BlackWeight700),
            73.verticalSizedBox,
            SignUpForm(),
            150.verticalSizedBox,
            SocialMediaButtons(),
          ],
        ).horizontalPadding(16),
      ),
    );
  }
}
