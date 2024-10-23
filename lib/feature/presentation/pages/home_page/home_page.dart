import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/theme.dart';
import 'package:rent_home/core/utils/app_locale_keys.dart';
import 'package:rent_home/feature/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widget/home_best_for_you_images_widget.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widget/home_best_for_you_title_widget.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widget/home_category_titles_widget.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widget/home_nearby_from_you_images_widget.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widget/home_nearby_from_your_title_widget.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widget/home_search_address_widget.dart';

import '../../../../injection_container.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final bloc = sl<HomeBloc>();
  final int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              centerTitle: false,
              title: Column(
                children: [
                  Text(
                    AppLocaleKeys.location,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.grey83, fontSize: 12.sp),
                  ),
                  Text(
                    AppLocaleKeys.jakarta,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.leadingColor, fontSize: 20.sp),
                  ),
                ],
              ).paddingOnly(left: 20.w),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none),
                ).paddingOnly(right: 20.w),
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SearchAddressWidget(bloc: bloc),
                  CategoryPartWidget(selectedIndex: selectedIndex)
                      .paddingOnly(top: 20.h),
                  const NearFromYouWidget()
                      .paddingOnly(top: 27.h, bottom: 24.h),
                  const NearFromYouImagesWidget(),
                  const BestForYouTitleWidget()
                      .paddingOnly(top: 20.h, bottom: 24.h),
                  const BestForYouImagesWidget(),
                ],
              ),
            ).paddingSymmetric(horizontal: 20.w),
          );
        },
      ),
    );
  }
}
