import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';

import '../../../../../core/router/app_routes.dart';
import '../../../bloc/home_bloc/home_bloc.dart';

class HomeSuccessAppBarWidget extends StatelessWidget {
  const HomeSuccessAppBarWidget({
    super.key,
    required this.state,
  });

  final HomeSuccessState state;

  @override
  Widget build(BuildContext context) {
    return BounceInRight(
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.notification);
        },
        icon: state.count > 0
            ? Badge.count(
                count: state.count,
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(bottom: 4.r),
                child: const Icon(Icons.notifications_none),
              )
            : const Icon(Icons.notifications_none),
      ).paddingOnly(right: 20.w),
    );
  }
}
