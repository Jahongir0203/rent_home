import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../data/models/house/get_houses_response.dart';
import '../../../bloc/home_bloc/home_bloc.dart';
import 'home_best_for_you_images_widget.dart';
import 'home_best_for_you_title_widget.dart';
import 'home_category_titles_widget.dart';
import 'home_nearby_from_you_images_widget.dart';
import 'home_nearby_from_your_title_widget.dart';
import 'home_search_address_widget.dart';

class HomeSuccessWidget extends StatelessWidget {
  const HomeSuccessWidget({
    super.key,
    required this.bloc,
    required this.houses,
  });

  final HomeBloc bloc;
  final List<House>? houses;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        bloc.add(HomeLoadedEvent());
      },
      color: AppColors.mainColor,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SearchAddressWidget(bloc: bloc),
            const CategoryPartWidget().paddingOnly(top: 20.h),
            const NearFromYouWidget().paddingOnly(top: 27.h, bottom: 24.h),
            NearFromYouImagesWidget(
              houses: houses,
            ),
            const BestForYouTitleWidget()
                .paddingOnly(top: 20.h, bottom: 24.h),
            BestForYouImagesWidget(
              houses: houses,
            ),
          ],
        ),
      ).paddingSymmetric(horizontal: 20.w),
    );
  }
}
