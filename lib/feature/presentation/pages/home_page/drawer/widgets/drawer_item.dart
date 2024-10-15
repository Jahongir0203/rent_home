import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_home/core/constantas/form_status.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_svg.dart';
import 'package:rent_home/core/theme/app_text_style.dart';
import 'package:rent_home/feature/presentation/pages/home_page/data/models/drawer_model.dart';
import 'package:rent_home/feature/presentation/pages/home_page/drawer/widgets/dialogs/dialog_drawer.dart';
import 'package:rent_home/feature/presentation/pages/home_page/open_launcher/open_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.item,
  });
  final DrawerModel item;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: item.type == DrawerItemFormType.routName
          ? () {
              Navigator.pushNamed(context, item.routName!);
            }
          : item.type == DrawerItemFormType.url
              ? () {
                  OpenLauncher.onOpenLauncher(item.url!);
                }
              : () {
                  dialogDrawer(context);
                },
      child: Container(
        width: width * 0.5,
        margin: EdgeInsets.symmetric(vertical: 6.h),
        padding: EdgeInsets.only(left: 20.w, top: 6.h, right: 28.w, bottom: 6.h),
        decoration: BoxDecoration(
          color: item.icon == AppSvg.icHome ? AppColors.white : AppColors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50.r),
            bottomRight: Radius.circular(50.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(item.icon),
            14.getW(),
            Text(
              item.title,
              style: AppTextStyle.w500H16.copyWith(color: item.icon == AppSvg.icHome ? AppColors.c0A8ED9 : AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
