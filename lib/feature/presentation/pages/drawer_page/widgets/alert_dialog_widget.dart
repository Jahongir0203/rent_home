import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/router/app_routes.dart';
import 'package:rent_home/feature/presentation/bloc/log_out_bloc/log_out_bloc.dart';
import 'package:rent_home/feature/presentation/widgets/app_toast.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_locale_keys.dart';
import '../../../../../injection_container.dart';

class AlertDialogWidget extends StatelessWidget {
  AlertDialogWidget({
    super.key,
  });

  final LogOutBloc bloc = sl<LogOutBloc>();
  final FToast fToast = FToast();

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<LogOutBloc, LogOutState>(
        builder: (context, state) {
          return AlertDialog(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            title: Column(
              children: [
                Icon(
                  Icons.warning_rounded,
                  size: 60.sp,
                  color: AppColors.red,
                ),
                SizedBox(height: 30.h),
                Text(
                  AppLocaleKeys.wantToLogOut,
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Raleway"),
                ),
              ],
            ),
            content: Text(
              AppLocaleKeys.willBeLostAllData,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black54),
            ).paddingOnly(
              bottom: 15.h
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  AppLocaleKeys.no,
                  style: TextStyle(color: Colors.grey, fontSize: 20.sp),
                ),
                onPressed: () {
                  Navigator.pop(context);
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
                  bloc.add(LogOutLoadedEvent());
                },
              ),
            ],
          );
        },
        listener: (BuildContext context, LogOutState state) {
          if (state is LogOutSuccessState) {
            Navigator.pop(context);
            fToast.showToast(
              child:
                  const AppSuccessToast(message: AppLocaleKeys.logOutSuccess),
              gravity: ToastGravity.TOP,
              toastDuration: const Duration(seconds: 3),
            );
            Navigator.pushReplacementNamed(context, Routes.login);
          }

          if (state is LogOutFailureState) {
            fToast.showToast(
              child: const AppErrorToast(message: AppLocaleKeys.serverError),
              gravity: ToastGravity.TOP,
              toastDuration: const Duration(seconds: 3),
            );
          }
        },
      ),
    );
  }
}
