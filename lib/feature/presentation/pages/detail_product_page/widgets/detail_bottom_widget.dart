import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_text_style.dart';
import 'package:rent_home/feature/presentation/widgets/main_global_button.dart';

class DetailBottomWidget extends StatelessWidget {
  const DetailBottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Price",
              style: AppTextStyle.w400H12,
            ),
            Text(
              "Rp. 2.500.000.000 / Year",
              style: AppTextStyle.w500H16,
            ),
          ],
        ),
        10.getW(),
        Expanded(
            child: MainGlobalButton(
          title: "Rent Now",
          high: 34.h,
        )),
      ],
    );
  }
}
