import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_lotties.dart';
import 'package:rent_home/feature/presentation/bloc/reset_password_bloc/reset_password_bloc.dart';
import 'package:rent_home/feature/presentation/widgets/app_custom_button.dart';
import 'package:rent_home/feature/presentation/widgets/app_text_form_field.dart';
import 'package:rent_home/feature/presentation/widgets/app_toast.dart';
import 'package:rent_home/feature/presentation/widgets/back_to_log_in.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_locale_keys.dart';
import '../../../../injection_container.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key});

  final bloc = sl<ResetPasswordBloc>();
  final FToast fToast = FToast();

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccessState) {
            fToast.showToast(
                toastDuration: const Duration(seconds: 4),
                gravity: ToastGravity.TOP,
                child: const AppToast(
                  icon: Icons.check,
                  message: AppLocaleKeys.resetPasswordSuccess,
                  bgColor: AppColors.green,
                ));
            Navigator.pushReplacementNamed(context, Routes.login);
          }

          if (state is ResetPasswordFailureState) {
            fToast.showToast(
                toastDuration: const Duration(seconds: 4),
                gravity: ToastGravity.TOP,
                child: AppToast(
                  icon: Icons.cancel,
                  message: state.failure,
                  bgColor: AppColors.red,
                ));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(AppLotties.resetPassword),
                Text(
                  AppLocaleKeys.resetPassword,
                  style: Theme.of(context).textTheme.labelLarge,
                ).paddingOnly(top: 40.h, bottom: 30.h),
                AppTextFormField(
                  hintText: AppLocaleKeys.enterCode,
                  isVisible: false,
                  controller: bloc.codeController,
                  keyBoardType: TextInputType.number,
                  prefixIcon: Icons.numbers,
                  onTab: (e) {},
                  textInputFormatter: bloc.maskFormatter,
                  error:
                      state is ResetPasswordInputErrorState ? state.code : null,
                ).paddingOnly(bottom: 20.h),
                AppTextFormField(
                  hintText: AppLocaleKeys.enterEmail,
                  isVisible: false,
                  error: state is ResetPasswordInputErrorState
                      ? state.email
                      : null,
                  controller: bloc.emailController,
                  keyBoardType: TextInputType.number,
                  prefixIcon: Icons.email,
                  onTab: (e) {},
                ).paddingOnly(bottom: 20.h),
                AppTextFormField(
                  hintText: AppLocaleKeys.enterNewPassword,
                  isVisible: state is ResetPasswordVisibilityState
                      ? state.isVisible
                      : true,
                  error: state is ResetPasswordInputErrorState
                      ? state.newPassword
                      : null,
                  canCopy: false,
                  controller: bloc.newPasswordController,
                  keyBoardType: TextInputType.visiblePassword,
                  prefixIcon: Icons.lock,
                  suffixIcon: IconButton(
                      onPressed: () {
                        bloc.add(ResetPasswordVisibilityEvent(
                            isVisible: state is ResetPasswordVisibilityState
                                ? !state.isVisible
                                : false));
                      },
                      icon: state is ResetPasswordVisibilityState
                          ? state.isVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off)),
                  onTab: (e) {},
                ).paddingOnly(bottom: 40.h),
                AppCustomButton(
                        onTap: () {
                          bloc.add(ResetPasswordLoadedEvent());
                        },
                        color: AppColors.mainColor,
                        text: AppLocaleKeys.resetPassword)
                    .paddingOnly(bottom: 40.h),
                const BackToLogIn()
              ],
            ).paddingSymmetric(horizontal: 20.w, vertical: 40.h),
          );
        },
      ),
    );
  }
}
