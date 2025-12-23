import 'package:ecommerce/core/extensions/app_extentions.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import 'RatingStars.dart';

class SaleProductItem extends StatefulWidget {
  final String image;
  final String brand;
  final String title;
  final int oldPrice;
  final int newPrice;
  final int discount;

  const SaleProductItem({
    super.key,
    required this.image,
    required this.brand,
    required this.title,
    required this.oldPrice,
    required this.newPrice,
    required this.discount,
  });

  @override
  State<SaleProductItem> createState() => _SaleProductItemState();
}

class _SaleProductItemState extends State<SaleProductItem> {
  bool isFavorite = false;
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.image,
                  width: 160,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.redColor,
                    borderRadius: 20.allBorderRadius,
                  ),
                  child: Text(
                    "-${widget.discount}%",
                    style: AppTextStyles.font11WhiteWeight400,
                  ),
                ),
              ),
              Positioned(
                bottom: 6,
                right: 6,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 16,
                      color: isFavorite
                          ? AppColors.redColor
                          : AppColors.grayColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          6.verticalSizedBox,
          Row(
            children: [
              RatingStars(
                onRatingChanged: (value) {
                  setState(() {
                    rating = value;
                  });
                },
              ),
              4.horizontalSizedBox,
              Text(
                "($rating)",
                style: AppTextStyles.font10GrayWeight400,
              ),
            ],
          ),
          4.verticalSizedBox,
          Text(widget.brand, style: AppTextStyles.font11GrayWeight400),
          Text(widget.title, style: AppTextStyles.font16BlackWeight400),
          3.verticalSizedBox,
          Row(
            children: [
              Text(
                "${widget.oldPrice}\$",
                style: AppTextStyles.font14GrayWeight500,
              ),
              const SizedBox(width: 6),
              Text(
                "${widget.newPrice}\$",
                style: AppTextStyles.font14RedWeight500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
