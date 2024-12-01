import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/services/storage_service.dart';
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
import 'package:rent_home/feature/presentation/widgets/app_circular_progress_indicator.dart';
import 'package:rent_home/feature/presentation/widgets/app_shimmer_container.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../injection_container.dart';
import '../../../data/models/house/get_houses_response.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final bloc = sl<HomeBloc>();
  final storageService = sl<StorageService>();
  String? currentLocation;

  void getCurrentLocation() async {
    currentLocation = await storageService.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    getCurrentLocation();
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: bloc..add(HomeLoadedEvent()),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              centerTitle: false,
              title: state is HomeSuccessState
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocaleKeys.location,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: AppColors.grey83, fontSize: 12.sp),
                        ),
                        Text(
                          state.currentLocation ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: AppColors.leadingColor,
                                  fontSize: 20.sp),
                        ),
                      ],
                    ).paddingOnly(left: 20.w)
                  : state is HomeFailureState
                      ? Text(
                          state.failure,
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        )
                      : Shimmer.fromColors(
                          baseColor: AppColors.baseColor.shade300,
                          highlightColor: AppColors.highlightColor.shade100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerContainer(h: 14.h, w: 48.w, r: 10.r)
                                  .paddingOnly(bottom: 10.h),
                              ShimmerContainer(h: 23.h, w: 70.w, r: 10.r),
                            ],
                          ),
                        ),
              actions: [
                state is HomeSuccessState
                    ? IconButton(
                        onPressed: () {},
                        icon: Badge.count(
                          count: 2,
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(bottom: 4.r),
                          child: const Icon(Icons.notifications_none),
                        ),
                      ).paddingOnly(right: 20.w)
                    : state is HomeLoadingState
                        ? ShimmerContainer(h: 24.r, w: 24.r, r: 10.r)
                        : const AppCircularProgressIndicator(),
              ],
            ),
            body: buildHomePageBody(state),
          );
        },
      ),
    );
  }

  buildHomePageBody(HomeState state) {
    if (state is HomeSuccessState) {
      List<House>? houses = state.housesResponse.house;
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SearchAddressWidget(bloc: bloc),
            CategoryPartWidget().paddingOnly(top: 20.h),
            NearFromYouWidget().paddingOnly(top: 27.h, bottom: 24.h),
            NearFromYouImagesWidget(
              houses: houses,
            ),
            const BestForYouTitleWidget().paddingOnly(top: 20.h, bottom: 24.h),
            BestForYouImagesWidget(
              houses: houses,
            ),
          ],
        ),
      ).paddingSymmetric(horizontal: 20.w);
    }

    if (state is HomeFailureState) {
      return const AppCircularProgressIndicator();
    }

    if (state is HomeLoadingState) {
      return SizedBox(
        height: 100.sh,
        width: 100.sw,
        child: Shimmer.fromColors(
          baseColor: AppColors.baseColor.shade300,
          highlightColor: AppColors.highlightColor.shade100,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ShimmerContainer(h: 48.h, r: 10.r)
                        .paddingOnly(right: 8.w),
                  ),
                  ShimmerContainer(
                    h: 48.r,
                    w: 48.r,
                    r: 10.r,
                  ),
                ],
              ).paddingOnly(bottom: 18.h, top: 22.h),
              SizedBox(
                height: 35.h,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ShimmerContainer(
                        h: 34.h,
                        w: 70.w,
                        r: 14.r,
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          width: 12.w,
                        ),
                    itemCount: 6),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerContainer(
                    h: 19.h,
                    w: 110.w,
                    r: 5.r,
                  ),
                  ShimmerContainer(
                    h: 14.h,
                    w: 55.w,
                    r: 5.r,
                  ),
                ],
              ).paddingOnly(top: 27.h, bottom: 24.h),
              SizedBox(
                height: 272.h,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ShimmerContainer(
                        h: 272.h,
                        w: 222.w,
                        r: 20.r,
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          width: 12.w,
                        ),
                    itemCount: 6),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerContainer(
                    h: 19.h,
                    w: 110.w,
                    r: 5.r,
                  ),
                  ShimmerContainer(
                    h: 14.h,
                    w: 55.w,
                    r: 5.r,
                  ),
                ],
              ).paddingOnly(top: 32.h, bottom: 24.h),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          ShimmerContainer(
                            h: 70.h,
                            w: 74.w,
                            r: 8,
                          ).paddingOnly(right: 20.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerContainer(
                                h: 19.h,
                                w: 107.w,
                              ),
                              ShimmerContainer(
                                h: 14.h,
                                w: 137.w,
                              ).paddingOnly(top: 8.h, bottom: 5.h),
                              ShimmerContainer(
                                h: 24.h,
                                w: 150.w,
                              ),
                            ],
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 24.h,
                        ),
                    itemCount: 6),
              ),
            ],
          ),
        ).paddingSymmetric(horizontal: 20.w),
      );
    }

    return const AppCircularProgressIndicator();
  }
}
