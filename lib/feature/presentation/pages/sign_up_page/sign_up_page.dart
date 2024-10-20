import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/feature/data/models/auth/request_register_model.dart';
import 'package:rent_home/feature/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:rent_home/feature/presentation/pages/log_in_page/log_in_page.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_locale_keys.dart';
import '../../../../injection_container.dart';
import '../../widgets/app_custom_button.dart';
import '../../widgets/app_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final bloc = sl<SignUpBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<SignUpBloc, SignUpState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            print("SignUp Success");
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LogInPage(),
                ));
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
                      onTab: (e) {
                        print(e);
                      }).paddingOnly(
                    top: 80.h,
                  ),
                  AppTextFormField(
                      hintText: AppLocaleKeys.phoneNumber,
                      isVisible: false,
                      controller: bloc.phoneNumberController,
                      keyBoardType: TextInputType.number,
                      prefixIcon: Icons.phone,
                      onTab: (e) {
                        print(e);
                      }).paddingOnly(top: 30.h),
                  AppTextFormField(
                      hintText: AppLocaleKeys.email,
                      isVisible: false,
                      controller: bloc.emailController,
                      keyBoardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email,
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
                      onTab: (e) {
                        print(e);
                      }).paddingOnly(top: 30.h),
                  AppTextFormField(
                      hintText: AppLocaleKeys.confirmPassword,
                      isVisible: state is SignUpVisibilityState
                          ? state.isVisible2
                          : true,
                      canCopy: false,
                      controller: bloc.confirmPasswordController,
                      keyBoardType: TextInputType.visiblePassword,
                      prefixIcon: Icons.lock,
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
                 state is SignUpLoadingState? const Center(child: CircularProgressIndicator(),): AppCustomButton(
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
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LogInPage(),
                          ));
                    },
                    splashColor: AppColors.mainColor.withOpacity(0.19),
                    borderRadius: BorderRadius.circular(8.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: AppLocaleKeys.haveAnAccount,
                              style: Theme.of(context).textTheme.headlineSmall,
                              children: [
                                TextSpan(
                                  text: AppLocaleKeys.logIn,
                                  style: Theme.of(context).textTheme.labelSmall,
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20.w, vertical: 80.h),
            ),
          );
        },
      ),
    );
  }
}
