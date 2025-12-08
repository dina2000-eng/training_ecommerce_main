import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'widgets/forgot_password_form.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

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
            Text("Forgot password", style: AppTextStyles.font34BlackWeight700),
            87.verticalSizedBox,
            Text(
              "Please, enter your email address. You will receive a link to create a new password via email.",
              style: AppTextStyles.font14BlackWeight500,
            ),
            16.verticalSizedBox,
            ForgotPasswordForm(),
          ],
        ).horizontalPadding(16),
      ),
    );
  }
}
