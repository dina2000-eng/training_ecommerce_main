import 'package:flutter/material.dart';

class RatingStars extends StatefulWidget {
  final int maxStars;
  final double size;
  final ValueChanged<int>? onRatingChanged;

  const RatingStars({
    super.key,
    this.maxStars = 5,
    this.size = 16,
    this.onRatingChanged,
  });

  @override
  State<RatingStars> createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  int currentRating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.maxStars, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentRating = index + 1;
            });
            widget.onRatingChanged?.call(currentRating);
          },
          child: Icon(
            index < currentRating ? Icons.star : Icons.star_border,
            color: Colors.orange,
            size: widget.size,
          ),
        );
      }),
    );
  }
}
