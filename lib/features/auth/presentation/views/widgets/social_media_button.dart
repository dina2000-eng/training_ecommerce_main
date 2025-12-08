import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.onTap,
    required this.imagePath,
  });
  final void Function() onTap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 34, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: 24.allBorderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              spreadRadius: 0,
              blurRadius: 8,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Image.asset(imagePath, width: 24, height: 24).center(),
      ),
    );
  }
}
