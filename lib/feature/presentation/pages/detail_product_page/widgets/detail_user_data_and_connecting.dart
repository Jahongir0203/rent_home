import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_svg.dart';
import 'package:rent_home/core/theme/app_text_style.dart';
import 'package:rent_home/feature/presentation/widgets/open_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DetailUserDataAndConnecting extends StatelessWidget {
  const DetailUserDataAndConnecting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        backgroundImage: NetworkImage("https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXZhdGFyfGVufDB8fDB8fHww"),
      ),
      title: Text(
        "Garry Allen",
        style: AppTextStyle.w500H16,
      ),
      subtitle: Text(
        "Owner",
        style: AppTextStyle.w400H12.copyWith(color: AppColors.c858585),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          satsialIconButton(AppSvg.icCall),
          10.getW(),
          satsialIconButton(AppSvg.icMassage),
        ],
      ),
    );
  }

  ZoomTapAnimation satsialIconButton(String icon) {
    return ZoomTapAnimation(
      onTap: () {
        OpenLauncher.onOpenLauncher("https://t.me/Muhriddinbek_off");
      },
      child: Container(
        alignment: Alignment.center,
        height: 28.h,
        width: 28.h,
        decoration: BoxDecoration(
          color: AppColors.c0A8ED9,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
