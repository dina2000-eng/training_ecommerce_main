import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:ecommerce/core/theme/app_text_styles.dart';
import 'package:ecommerce/generated/app_assets.dart';
import 'package:flutter/material.dart';

import 'social_media_button.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Or sign up with social account",
          style: AppTextStyles.font14BlackWeight500,
        ),
        12.verticalSizedBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialMediaButton(onTap: () {}, imagePath: AppAssets.imagesGoogle),
            16.horizontalSizedBox,
            SocialMediaButton(
              onTap: () {},
              imagePath: AppAssets.imagesFacebook,
            ),
          ],
        ),
      ],
    );
  }
}
