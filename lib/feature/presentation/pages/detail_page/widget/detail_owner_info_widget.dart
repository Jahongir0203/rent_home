import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_svg.dart';
import '../../../widgets/app_widgets.dart';

class OwnerInfoWidget extends StatelessWidget {
  const OwnerInfoWidget({
    super.key,
  });

  /// make a call
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not make the call to $phoneNumber';
    }
  }

  /// make a telegram message
  Future<void> openTelegramProfile(String username) async {
    final Uri url = Uri.parse('https://t.me/$username'); // Fallback web URL
    final Uri tgUrl =
        Uri.parse('tg://resolve?domain=$username'); // Telegram app URL

    if (await canLaunchUrl(tgUrl)) {
      // Open in Telegram app
      await launchUrl(tgUrl);
    } else if (await canLaunchUrl(url)) {
      // Fallback to browser
      await launchUrl(url);
    } else {
      throw 'Could not launch Telegram profile for $username';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ZoomIn(
          child: CircleAvatar(
            backgroundColor: AppColors.grey83,
            radius: 20.r,
            child: const Icon(
              Icons.person,
              color: AppColors.white,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BounceInDown( 
              child: Text(
                "Garrey Allen",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: AppColors.leadingColor),
              ).paddingOnly(bottom: 4.h),
            ),
            BounceInUp(
              child: Text(
                "Owner",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: AppColors.grey85, fontSize: 12.sp),
              ),
            ),
          ],
        ).paddingOnly(left: 16.w),
        ZoomIn(
          child: OwnerContactInfo(
            onTap: () {
              makePhoneCall("+998930836460");
            },
            svg: AppSvg.icPhoneLight,
          ).paddingOnly(left: 122.w, right: 16.w),
        ),
        ZoomIn(
          child: OwnerContactInfo(
            onTap: () {
              openTelegramProfile("Jahongir0203");
            },
            svg: AppSvg.icMessage,
          ),
        ),
      ],
    );
  }
}

class OwnerContactInfo extends StatelessWidget {
  const OwnerContactInfo({
    super.key,
    required this.onTap,
    required this.svg,
  });

  final VoidCallback onTap;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5.r),
      child: Container(
        height: 28.r,
        width: 28.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: AppColors.gradient2.withOpacity(0.7),
        ),
        child: AppWidgets.imageSvg(path: svg).paddingAll(6.r),
      ),
    );
  }
}
