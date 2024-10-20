import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_home/core/theme/theme.dart';

Future<dynamic> homeDialogDrawer(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: SvgPicture.asset(
          AppSvg.icLogOut,
          colorFilter: ColorFilter.mode(AppColors.cFA0E0E, BlendMode.srcIn),
        ),
        title: const Divider(),
        content: Text(
          "Do you want to log out of your account?",
          textAlign: TextAlign.center,
          style: AppTextStyle.w500H16,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Yes"),
          ),
        ],
      );
    },
  );
}
