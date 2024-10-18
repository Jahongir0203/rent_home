import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/feature/presentation/bloc/log_In_bloc/log_in_bloc.dart';
import 'package:rent_home/feature/presentation/pages/forgot_password/forgot_password_page.dart';
import 'package:rent_home/feature/presentation/pages/sign_up_page/sign_up_page.dart';
import 'package:rent_home/feature/presentation/widgets/app_custom_button.dart';
import 'package:rent_home/feature/presentation/widgets/app_text_form_field.dart';

import '../../../../core/utils/app_locale_keys.dart';
import '../../../../injection_container.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  final bloc = sl<LogInBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<LogInBloc, LogInState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocaleKeys.logIn,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.start,
                ),
                AppTextFormField(
                    hintText: AppLocaleKeys.email,
                    isVisible: false,
                    controller: bloc.emailController,
                    keyBoardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                    onTab: (e) {
                      print(e);
                    }).paddingOnly(top: 80.h),
                AppTextFormField(
                    hintText: AppLocaleKeys.password,
                    isVisible: true,
                    canCopy: false,
                    controller: bloc.passwordController,
                    keyBoardType: TextInputType.visiblePassword,
                    prefixIcon: Icons.lock,
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: Icon(Icons.visibility_off)),
                    onTab: (e) {
                      print(e);
                    }).paddingOnly(top: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPasswordPage(),
                            ));
                      },
                      child: Text(
                        AppLocaleKeys.forgotPassword,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ).paddingOnly(top: 10.h),
                AppCustomButton(
                        onTap: () {},
                        color: AppColors.mainColor,
                        text: AppLocaleKeys.logIn)
                    .paddingOnly(top: 60.h, bottom: 20.h),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ));
                  },
                  splashColor: AppColors.mainColor.withOpacity(0.19),
                  borderRadius: BorderRadius.circular(8.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: AppLocaleKeys.registerYet,
                            style: Theme.of(context).textTheme.headlineSmall,
                            children: [
                              TextSpan(
                                text: AppLocaleKeys.signUp,
                                style: Theme.of(context).textTheme.labelSmall,
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ).paddingSymmetric(horizontal: 20.w, vertical: 80.h),
    );
  }
}
