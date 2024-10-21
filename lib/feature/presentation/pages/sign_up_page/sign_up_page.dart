import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/router/app_routes.dart';
import 'package:rent_home/feature/data/models/auth/request_register_model.dart';
import 'package:rent_home/feature/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:rent_home/feature/presentation/pages/log_in_page/log_in_page.dart';
import 'package:rent_home/feature/presentation/pages/sign_up_page/widgets/sign_up_have_an_account_widget.dart';
import 'package:rent_home/feature/presentation/widgets/app_toast.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_locale_keys.dart';
import '../../../../injection_container.dart';
import '../../widgets/app_circular_progress_indicator.dart';
import '../../widgets/app_custom_button.dart';
import '../../widgets/app_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final bloc = sl<SignUpBloc>();
  final FToast fToast = FToast();

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<SignUpBloc, SignUpState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is SignUpFailureState) {
            fToast.showToast(
              child: AppToast(
                icon: Icons.error,
                message: state.failure,
                bgColor: AppColors.red,
              ),
              toastDuration: const Duration(seconds: 3),
              isDismissable: true,
               gravity: ToastGravity.TOP
            );
          }

          if (state is SignUpSuccessState) {
            fToast.showToast(
              child: const AppToast(
                icon: Icons.check,
                message: AppLocaleKeys.registerSuccess,
                bgColor: AppColors.green,
              ),
                toastDuration: const Duration(seconds: 3),
                isDismissable: true,
                gravity: ToastGravity.TOP
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LogInPage(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocaleKeys.signUp,
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.start,
                  ),
                  AppTextFormField(
                      hintText: AppLocaleKeys.fullName,
                      isVisible: false,
                      controller: bloc.fullNameController,
                      keyBoardType: TextInputType.name,
                      prefixIcon: Icons.person,
                      error: state is SignUpInputErrorState? state.fullName:null,
                      onTab: (e) {
                        print(e);
                      }).paddingOnly(
                    top: 80.h,
                  ),
                  AppTextFormField(
                      hintText: AppLocaleKeys.phoneNumber,
                      isVisible: false,
                      textInputFormatter: bloc.maskFormatter,
                      controller: bloc.phoneNumberController,
                      keyBoardType: TextInputType.number,
                      prefixIcon: Icons.phone,
                      error: state is SignUpInputErrorState? state.phoneNumber:null,
                      onTab: (e) {
                        print(e);
                      }).paddingOnly(top: 30.h),
                  AppTextFormField(
                      hintText: AppLocaleKeys.email,
                      isVisible: false,
                      controller: bloc.emailController,
                      keyBoardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email,
                      error: state is SignUpInputErrorState? state.email:null,
                      onTab: (e) {
                        print(e);
                      }).paddingOnly(top: 30.h),
                  AppTextFormField(
                          hintText: AppLocaleKeys.password,
                          isVisible: state is SignUpVisibilityState
                              ? state.isVisible1
                              : true,
                          canCopy: false,
                          controller: bloc.passwordController,
                          keyBoardType: TextInputType.visiblePassword,
                          prefixIcon: Icons.lock,
                      error: state is SignUpInputErrorState? state.password:null,
                          suffixIcon: IconButton(
                              onPressed: () {
                                bloc.add(state is SignUpVisibilityState
                                    ? SignUpPasswordEvent(
                                        isVisible2: state.isVisible2,
                                        isVisible1: !state.isVisible1)
                                    : SignUpPasswordEvent(
                                        isVisible2: true, isVisible1: false));
                              },
                              icon: state is SignUpVisibilityState
                                  ? state.isVisible1
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          onTab: (e) {})
                      .paddingOnly(top: 30.h),
                  AppTextFormField(
                      hintText: AppLocaleKeys.confirmPassword,
                      isVisible: state is SignUpVisibilityState
                          ? state.isVisible2
                          : true,
                      canCopy: false,
                      controller: bloc.confirmPasswordController,
                      keyBoardType: TextInputType.visiblePassword,
                      prefixIcon: Icons.lock,
                      error: state is SignUpInputErrorState? state.confirmPassword:null,
                      suffixIcon: IconButton(
                          onPressed: () {
                            bloc.add(state is SignUpVisibilityState
                                ? SignUpPasswordEvent(
                                    isVisible2: !state.isVisible2,
                                    isVisible1: state.isVisible1)
                                : SignUpPasswordEvent(
                                    isVisible2: false, isVisible1: true));
                          },
                          icon: state is SignUpVisibilityState
                              ? state.isVisible2
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      onTab: (e) {
                        print(e);
                      }).paddingOnly(top: 30.h),
                  state is SignUpLoadingState
                      ? const AppCircularProgressIndicator()
                      : AppCustomButton(
                              onTap: () {
                                bloc.add(SignUpLoadedEvent(
                                    requestRegisterModel: RequestRegisterModel(
                                        password: bloc.passwordController.text,
                                        email: bloc.emailController.text,
                                        confirmPassword:
                                            bloc.confirmPasswordController.text,
                                        fullName: bloc.fullNameController.text,
                                        phoneNumber:
                                            bloc.phoneNumberController.text)));
                              },
                              color: AppColors.mainColor,
                              text: AppLocaleKeys.signUp)
                          .paddingOnly(top: 60.h, bottom: 20.h),
                  SignUpHaveAnAccountWidget(context, () {
                    Navigator.pushReplacementNamed(context, Routes.login);
                  }),
                ],
              ).paddingSymmetric(horizontal: 20.w, vertical: 80.h),
            ),
          );
        },
      ),
    );
  }
}
