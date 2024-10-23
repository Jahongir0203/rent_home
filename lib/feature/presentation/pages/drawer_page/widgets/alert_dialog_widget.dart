import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_locale_keys.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: Column(
        children: [
          Icon(
            Icons.warning_rounded,
            size: 40.sp,
            color: AppColors.red,
          ),
          SizedBox(height: 10.h),
          Text(
            AppLocaleKeys.wantToLogOut,
            style: TextStyle(
                fontSize: 27.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "Raleway"),
          ),
        ],
      ),
      content: Text(
        AppLocaleKeys.willBeLostAllData,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.black54),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            AppLocaleKeys.no,
            style: TextStyle(color: Colors.grey, fontSize: 20.sp),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0.r),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocaleKeys.yes,
                style: TextStyle(color: AppColors.white, fontSize: 20.sp),
              ),
              const Icon(
                Icons.arrow_right_alt,
                color: AppColors.white,
              ),
            ],
          ),
          onPressed: () {
            Navigator.of(context)
                .pop(); // This is where the logout logic will go
          },
        ),
      ],
    );
  }
}
