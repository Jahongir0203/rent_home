import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/theme.dart';
import 'package:rent_home/feature/presentation/bloc/notification_bloc/notification_bloc.dart';

import '../../../../core/utils/app_locale_keys.dart';
import '../../../../injection_container.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  final bloc = sl<NotificationBloc>();

  @override
  Widget build(BuildContext context) {
    int delay = 200;

    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<NotificationBloc, NotificationState>(
        bloc: bloc..add(NotificationLoadedEvent()),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 2,
              shadowColor: AppColors.white,
              backgroundColor: AppColors.white,
              centerTitle: false,
              title: BounceInUp(
                child: Text(
                  AppLocaleKeys.notification,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: AppColors.black87,
                      fontSize: 27.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            body: buildNotificationBody(delay, state)
                .paddingSymmetric(horizontal: 20.w),
          );
        },
      ),
    );
  }

  Widget buildNotificationBody(int delay, NotificationState state) {
    if (state is NotificationSuccessState) {
      return ListView.separated(
        padding: EdgeInsets.only(top: 20.h),
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return BounceInLeft(
            delay: Duration(milliseconds: delay + index * 100),
            child: Container(
              height: 160.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.cGRAY2.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.cGRAY2.withOpacity(0.03),
                        blurStyle: BlurStyle.outer,
                        offset: const Offset(2, 0),
                        // spreadRadius: 5,
                        blurRadius: 5)
                  ]),
              child: Material(
                color: AppColors.transparent,
                child: InkWell(
                  splashColor: AppColors.cGRAY2.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20.r),
                  onTap: () {
                    bloc.add(NotificationReadEvent(index: index));
                    buildNotificationShowModalBottomSheet(
                        context, state, index);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      state.indexs.contains(index)
                          ? const SizedBox.shrink()
                          : Container(
                              height: 160.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  bottomLeft: Radius.circular(20.r),
                                ),
                              ),
                            ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    AppSvg.icNotification,
                                    height: 60.r,
                                    width: 60.r,
                                  ).paddingSymmetric(
                                      horizontal: 20.w, vertical: 20.h),
                                  Expanded(
                                    child: Text(
                                      notifications[index],
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                              color: AppColors.black87,
                                              fontSize: 18.sp),
                                    ).paddingOnly(top: 20.h, right: 20.w),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.time,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                          color: AppColors.black54,
                                          fontSize: 16.sp),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.black54,
                                  size: 16.r,
                                )
                              ],
                            ).paddingSymmetric(
                                horizontal: 20.w, vertical: 20.h),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 25.h);
        },
      );
    }

    return const SizedBox();
  }

  Future<dynamic> buildNotificationShowModalBottomSheet(
      BuildContext context, NotificationSuccessState state, int index) {
    return showModalBottomSheet(
      isScrollControlled: false,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return SizedBox(
          width: 100.sw,
          height: 40.sh,
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BounceInLeft(
                    child: Text(
                      state.time.substring(0, 16),
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: AppColors.black54, fontSize: 24.sp),
                    ),
                  ),
                  BounceInRight(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.cancel,
                        size: 30.sp,
                      ),
                    ),
                  ),
                ],
              ),
              ZoomIn( 
                child: Text(
                  notifications[index],
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColors.black54, fontSize: 20.sp),
                ).paddingOnly(top: 20.h),
              )
            ],
          ).paddingSymmetric(horizontal: 20.w),
        );
      },
    );
  }
}
