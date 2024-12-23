import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/feature/data/models/auth/request_log_In_model.dart';
import 'package:rent_home/feature/presentation/bloc/log_In_bloc/log_in_bloc.dart';
import 'package:rent_home/feature/presentation/pages/log_in_page/widget/log_in_not_account_widget.dart';
import 'package:rent_home/feature/presentation/widgets/app_circular_progress_indicator.dart';
import 'package:rent_home/feature/presentation/widgets/app_custom_button.dart';
import 'package:rent_home/feature/presentation/widgets/app_text_form_field.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/utils/app_locale_keys.dart';
import '../../../../injection_container.dart';
import '../../widgets/app_toast.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  final bloc = sl<LogInBloc>();

  final FToast fToast = FToast();

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocProvider(
  create: (context) => bloc,
  child: BlocConsumer<LogInBloc, LogInState>(
    bloc: bloc,
    listener: (BuildContext context, LogInState state) {
      if (state is LogInFailureState) {
        fToast.showToast(
            child: AppErrorToast(
              message: state.failure,
            ),
            toastDuration: const Duration(seconds: 3),
            isDismissable: true,
            gravity: ToastGravity.TOP);
      }
      if (state is LogInSuccessState) {
        fToast.showToast(
            child: const AppSuccessToast(
              message: AppLocaleKeys.logInSuccess,
            ),
            toastDuration: const Duration(seconds: 3),
            isDismissable: true,
            gravity: ToastGravity.TOP);
        Navigator.pushReplacementNamed(context, Routes.drawer);
      }
    },
  builder: (context, state) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:buildLogInBody(context, state),
    );
  },
),
);
  }

  Widget buildLogInBody(BuildContext context, LogInState state) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BounceInLeft(
            child: Text(
              AppLocaleKeys.logIn,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.start,
            ),
          ),
          ElasticInUp(
            child: AppTextFormField(
                    hintText: AppLocaleKeys.email,
                    isVisible: false,
                    controller: bloc.emailController,
                    keyBoardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                    error: state is LogInInputErrorState ? state.email : null,
                    onTab: (e) {})
                .paddingOnly(top: 80.h),
          ),
          ElasticInDown(
            child: AppTextFormField(
                    hintText: AppLocaleKeys.password,
                    isVisible:
                        state is LogInVisibilityState ? state.isVisible : true,
                    canCopy: false,
                    controller: bloc.passwordController,
                    keyBoardType: TextInputType.visiblePassword,
                    prefixIcon: Icons.lock,
                    error: state is LogInInputErrorState ? state.password : null,
                    suffixIcon: IconButton(
                        onPressed: () {
                          bloc.add(LogInVisibilityEvent(
                              isVisible: state is LogInVisibilityState
                                  ? !state.isVisible
                                  : false));
                        },
                        icon: state is LogInVisibilityState
                            ? state.isVisible
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    onTab: (e) {})
                .paddingOnly(top: 30.h),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BounceInRight(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.forgotPassword);
                  },
                  child: Text(
                    AppLocaleKeys.forgotPassword,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ).paddingOnly(top: 10.h),
          state is LogInLoadingState
              ? const AppCircularProgressIndicator()
              : ZoomIn(
                child: AppCustomButton(
                        onTap: () {
                          bloc.add(LogInLoadedEvent(
                              requestLogInModel: RequestLogInModel(
                                  email: bloc.emailController.text,
                                  password: bloc.passwordController.text)));
                        },
                        color: AppColors.mainColor,
                        text: AppLocaleKeys.logIn)
                    .paddingOnly(top: 60.h, bottom: 20.h),
              ),
          const LogInHaveNotAccountWidget(),
        ],
      ).paddingSymmetric(horizontal: 20.w, vertical: 80.h),
    );
  }
}
