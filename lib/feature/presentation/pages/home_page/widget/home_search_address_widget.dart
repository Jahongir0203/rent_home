import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/router/app_routes.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_svg.dart';
import '../../../../../core/utils/app_locale_keys.dart';
import '../../../bloc/home_bloc/home_bloc.dart';
import '../../../widgets/app_text_form_field.dart';
import '../../../widgets/app_widgets.dart';

class SearchAddressWidget extends StatelessWidget {
  const SearchAddressWidget({
    super.key,
    required this.bloc,
  });

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BounceInLeft(
            child: AppTextFormField(
                hintText: AppLocaleKeys.searchHintTitle,
                isVisible: false,
                controller: bloc.searchController,
                keyBoardType: TextInputType.text,
                prefixIcon: Icons.search,
                onTab: (e) {}),
          ),
        ),
        BounceInRight(
          child: Material(
            color: Colors.transparent,
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.gradient1,
                    AppColors.gradient2,
                  ],
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.settings);
                },
                splashColor: AppColors.grey83.withOpacity(0.3),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
                child: SizedBox(
                  height: 48.r,
                  width: 48.r,
                  child: AppWidgets.imageSvg(path: AppSvg.icSettings)
                      .paddingAll(12.r),
                ),
              ),
            ).paddingOnly(left: 8.w),
          ),
        )
      ],
    );
  }
}
