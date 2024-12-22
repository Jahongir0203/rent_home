import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';

import '../../../core/theme/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    required this.isVisible,
    required this.controller,
    required this.keyBoardType,
    required this.prefixIcon,
    this.textInputFormatter,
    required this.onTab,
    this.validate,
    this.error,
    this.canCopy,
  });

  final String hintText;
  final Widget? suffixIcon;
  final bool isVisible;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final IconData prefixIcon;
  final TextInputFormatter? textInputFormatter;
  final String? error;
  final bool? canCopy;
  final onTab;
  final validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodySmall,
      inputFormatters: textInputFormatter == null
          ? null
          : [
              textInputFormatter!,
            ],
      controller: controller,
      obscureText: isVisible,
      textAlign: TextAlign.start,
      keyboardType: keyBoardType,
      textAlignVertical: TextAlignVertical.center,
      onChanged: onTab,
      validator: validate,
      enableInteractiveSelection: canCopy ?? true,
      decoration: InputDecoration(
        border: Theme.of(context).inputDecorationTheme.border,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        filled: Theme.of(context).inputDecorationTheme.filled,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        contentPadding: Theme.of(context).inputDecorationTheme.contentPadding,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        errorText: error,
        suffixIconColor: AppColors.mainColor,
        prefixIconColor: AppColors.mainColor.withOpacity(0.7),
        hintText: hintText,
        hintTextDirection: TextDirection.ltr,
        suffixIcon: suffixIcon ?? suffixIcon,
        prefixIcon: Icon(prefixIcon).paddingAll(5),
      ),
    );
  }
}
