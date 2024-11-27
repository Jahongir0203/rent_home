import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({super.key, this.h, this.w, this.r});

  final double? h;
  final double? w;
  final double? r;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(r?? 5),
      ),
    );
  }
}
