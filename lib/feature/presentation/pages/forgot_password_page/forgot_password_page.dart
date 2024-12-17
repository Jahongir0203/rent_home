import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/router/app_routes.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_lotties.dart';
import 'package:rent_home/core/utils/app_locale_keys.dart';
import 'package:rent_home/feature/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:rent_home/feature/presentation/widgets/app_circular_progress_indicator.dart';
import 'package:rent_home/feature/presentation/widgets/app_custom_button.dart';
import 'package:rent_home/feature/presentation/widgets/app_text_form_field.dart';
import 'package:rent_home/feature/presentation/widgets/app_toast.dart';

import '../../../../injection_container.dart';
import '../../widgets/back_to_log_in.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final bloc = sl<ForgotPasswordBloc>();
  final FToast fToast = FToast();

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ZoomIn(
                  child: Lottie.asset(
                    AppLotties.forgotPassword,
                    height: MediaQuery.of(context).size.height / 3,
                    repeat: false,
                  ),
                ),
                BounceInDown(
                  child: Text(
                    AppLocaleKeys.forgotPassword,
                    style: Theme.of(context).textTheme.labelLarge,
                  ).paddingOnly(top: 40.h, bottom: 10.h),
                ),
                BounceInUp(
                  child: Text(
                    AppLocaleKeys.resentInstruction,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                BounceInLeft(
                  child: AppTextFormField(
                          hintText: AppLocaleKeys.enterEmail,
                          isVisible: false,
                          error: state is ForgotPasswordErrorState
                              ? state.email
                              : null,
                          controller: bloc.emailController,
                          keyBoardType: TextInputType.emailAddress,
                          prefixIcon: Icons.email,
                          onTab: (e) {})
                      .paddingOnly(top: 40.h, bottom: 30.h),
                ),
                state is ForgotPasswordLoadingState
                    ? const AppCircularProgressIndicator()
                    : BounceInRight(
                      child: AppCustomButton(
                              onTap: () {
                                bloc.add(ForgotPasswordLoadedEvent());
                              },
                              color: AppColors.mainColor,
                               text: AppLocaleKeys.resetPassword)
                           .paddingOnly(bottom: 40.h),
                    ),
                ZoomIn(child: const BackToLogIn())
              ],
            ).paddingSymmetric(horizontal: 20.w, vertical: 80.h),
          ));
        },
        listener: (BuildContext context, ForgotPasswordState state) {
          if (state is ForgotPasswordSuccessState) {
            fToast.showToast(
              toastDuration: const Duration(seconds: 3),
              gravity: ToastGravity.TOP,
              child: const AppSuccessToast(
                message: AppLocaleKeys.forgotPasswordSuccess,
              ),
            );
            Navigator.pushReplacementNamed(context, Routes.resetPassword);
          }

          if (state is ForgotPasswordFailureState) {
            fToast.showToast(
              toastDuration: const Duration(seconds: 3),
              gravity: ToastGravity.TOP,
              child: const AppErrorToast(
                message: AppLocaleKeys.userNotFound,
              ),
            );
          }
        },
      ),
    );
  }
}
