import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_svg.dart';
import 'package:rent_home/core/theme/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeAppBarItem extends StatelessWidget {
  const HomeAppBarItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: AppTextStyle.w400H12,
        ),
        Row(
          children: [
            Text(
              "Jakarta",
              style: AppTextStyle.w600H20.copyWith(fontWeight: FontWeight.w500),
            ),
            10.getW(),
            ZoomTapAnimation(
              onTap: () {},
              child: SvgPicture.asset(AppSvg.icToDown),
            ),
          ],
        ),
      ],
    );
  }
}
