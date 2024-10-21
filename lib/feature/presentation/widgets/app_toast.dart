import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/feature/presentation/widgets/app_widgets.dart';

import '../../../core/theme/app_colors.dart';

class AppToast extends StatelessWidget {
  const AppToast(
      {super.key, required this.icon, required this.message, this.bgColor});

  final IconData icon;
  final String message;
  final bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: bgColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppColors.white,
          ),
          SizedBox(
            width: 12.0.w,
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.displaySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
