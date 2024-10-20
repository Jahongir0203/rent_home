import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/router/app_routes.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_svg.dart';
import 'package:rent_home/core/theme/app_text_style.dart';
import 'package:rent_home/feature/presentation/pages/detail_product_page/widgets/detail_app_bar.dart';
import 'package:rent_home/feature/presentation/pages/detail_product_page/widgets/detail_on_tab_icon_button.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/home_item_opasicty.dart';

class DetailTitle extends StatelessWidget {
  const DetailTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const DetailAppBar(),
        const HomeItemOpasicty(),
        SizedBox(
          height: height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DetailOnTabIconBotton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    iconName: AppSvg.icBack,
                  ),
                  DetailOnTabIconBotton(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.bookmark);
                    },
                    iconName: AppSvg.icBookmark,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dreamsville House",
                    style: AppTextStyle.w600H20.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    "Jl. Sultan Iskandar Muda, Jakarta selatan",
                    style: AppTextStyle.w400H12.copyWith(
                      color: AppColors.cD7D7D7,
                    ),
                  ),
                  16.getH(),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppSvg.icBadroom,
                        colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                      ),
                      Text(
                        "6 Bedroom",
                        style: AppTextStyle.w400H12.copyWith(
                          color: AppColors.cD7D7D7,
                        ),
                      ),
                      16.getW(),
                      SvgPicture.asset(
                        AppSvg.icBathroom,
                        colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                      ),
                      Text(
                        "4 Bathroom",
                        style: AppTextStyle.w400H12.copyWith(
                          color: AppColors.cD7D7D7,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ).paddingSymmetric(horizontal: 14.w, vertical: 14.h),
        )
      ],
    );
  }
}
