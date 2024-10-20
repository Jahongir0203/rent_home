import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/feature/data/models/auth/request_log_In_model.dart';
import 'package:rent_home/feature/presentation/bloc/log_In_bloc/log_in_bloc.dart';
import 'package:rent_home/feature/presentation/pages/home_page/home_page.dart';
import 'package:rent_home/feature/presentation/pages/sign_up_page/sign_up_page.dart';
import 'package:rent_home/feature/presentation/widgets/app_custom_button.dart';
import 'package:rent_home/feature/presentation/widgets/app_text_form_field.dart';

import '../../../../core/utils/app_locale_keys.dart';
import '../../../../injection_container.dart';
import '../forgot_password_page/forgot_password_page.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  final bloc = sl<LogInBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocConsumer<LogInBloc, LogInState>(
          builder: (context, state) {
            return buildLogInBody(context, state);
          },
          listener: (BuildContext context, LogInState state) {
            if (state is LogInSuccessState) {
              print("success");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            }
          },
        ),
      ).paddingSymmetric(horizontal: 20.w, vertical: 80.h),
    );
  }

  Column buildLogInBody(BuildContext context, LogInState state) {
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
            isVisible: state is LogInVisibilityState ? state.isVisible : true,
            canCopy: false,
            controller: bloc.passwordController,
            keyBoardType: TextInputType.visiblePassword,
            prefixIcon: Icons.lock,
            suffixIcon: IconButton(
                onPressed: () {
                  print(state is LogInVisibilityState);
                  bloc.add(LogInVisibilityEvent(
                      isVisible: state is LogInVisibilityState
                          ? !state.isVisible
                          : false));
                  print(state is LogInVisibilityState);
                },
                icon: state is LogInVisibilityState
                    ? state.isVisible
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off)),
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
        state is LogInLoadingState
            ? Center(
                child: SizedBox(
                    height: 30.sp,
                    width: 30.sp,
                    child: const CircularProgressIndicator(
                      color: AppColors.mainColor,
                    )),
              )
            : AppCustomButton(
                    onTap: () {
                      bloc.add(LogInLoadedEvent(
                          requestLogInModel: RequestLogInModel(
                              email: bloc.emailController.text,
                              password: bloc.passwordController.text)));
                    },
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
  }
}
