import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/theme.dart';
import 'package:rent_home/feature/presentation/pages/global_widgets/main_global_button.dart';
import 'package:rent_home/feature/presentation/pages/sign_up_page/widgets/input_password_field.dart';
import 'package:rent_home/feature/presentation/pages/sign_up_page/widgets/input_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  "Create your new account",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.w600H20.copyWith(fontSize: 30.sp),
                ),
                const Spacer(),
                InputTextField(
                  hintTextName: "Full Name",
                  textController: userNameController,
                  inputType: TextInputType.name,
                  icon: AppSvg.icUser,
                ),
                10.getH(),
                InputTextField(
                  hintTextName: "Email",
                  textController: emailController,
                  inputType: TextInputType.emailAddress,
                  icon: AppSvg.icEmail,
                ),
                10.getH(),
                InputTextField(
                  hintTextName: "Phone Number",
                  textController: phoneNumberController,
                  inputType: TextInputType.phone,
                  icon: AppSvg.icCall,
                ),
                10.getH(),
                InputPasswordField(
                  hintTextName: "Password",
                  textController: passwordController,
                  inputType: TextInputType.text,
                  icon: AppSvg.icLock,
                  isTextObscure: true,
                  onTap: () {},
                ),
                10.getH(),
                InputPasswordField(
                  hintTextName: "Confirm Password",
                  textController: confirmPasswordController,
                  inputType: TextInputType.text,
                  icon: AppSvg.icLock,
                  isTextObscure: false,
                  onTap: () {},
                ),
                const Spacer(),
                const MainGlobalButton(
                  title: "Sign Up",
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You have an account?",
                      style: AppTextStyle.w500H13,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign In",
                        style: AppTextStyle.w500H13.copyWith(color: AppColors.linerGradient2),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ).paddingSymmetric(horizontal: 20.w),
          ),
        ),
      ),
    );
  }
}
