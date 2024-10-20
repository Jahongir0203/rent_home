import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_lotties.dart';
import 'package:rent_home/core/utils/app_locale_keys.dart';
import 'package:rent_home/feature/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:rent_home/feature/presentation/pages/log_in_page/log_in_page.dart';
import 'package:rent_home/feature/presentation/widgets/app_custom_button.dart';
import 'package:rent_home/feature/presentation/widgets/app_text_form_field.dart';

import '../../../../injection_container.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final bloc = sl<ForgotPasswordBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
              body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(AppLotties.forgotPassword),
              Text(
                AppLocaleKeys.forgotPassword,
                style: Theme.of(context).textTheme.labelLarge,
              ).paddingOnly(top: 40.h, bottom: 10.h),
              Text(
                AppLocaleKeys.resentInstruction,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              AppTextFormField(
                  hintText: AppLocaleKeys.enterEmail,
                  isVisible: false,
                  controller: bloc.emailController,
                  keyBoardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email,
                  onTab: (e) {
                    print(e);
                  }).paddingOnly(top: 40.h, bottom: 30.h),
              AppCustomButton(
                      onTap: () {},
                      color: AppColors.mainColor,
                      text: AppLocaleKeys.resetPassword)
                  .paddingOnly(bottom: 40.h),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogInPage(),
                      ));
                },
                splashColor: AppColors.mainColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.keyboard_backspace,
                      color: AppColors.black54,
                    ).paddingOnly(right: 5.w),
                    Text(
                      AppLocaleKeys.backToLogIn,
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 20.w, vertical: 80.h));
        },
      ),
    );
  }
}
