import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_svg.dart';
import 'package:rent_home/core/theme/app_text_style.dart';

class BestForTitle extends StatelessWidget {
  const BestForTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Orchad House", style: AppTextStyle.w500H16),
        Text(
          "Rp. 2.500.000.000 / Year",
          style: AppTextStyle.w400H12.copyWith(color: AppColors.c0A8ED9),
        ),
        Row(
          children: [
            SvgPicture.asset(AppSvg.icBadroom),
            Text(
              "6 Bedroom",
              style: AppTextStyle.w400H12,
            ),
            14.getW(),
            SvgPicture.asset(AppSvg.icBathroom),
            Text(
              "2 Bathroom",
              style: AppTextStyle.w400H12,
            ),
          ],
        ),
      ],
    );
  }
}
