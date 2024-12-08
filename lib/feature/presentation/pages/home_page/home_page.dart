import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/services/storage_service.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/theme.dart';
import 'package:rent_home/core/utils/app_locale_keys.dart';
import 'package:rent_home/feature/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widget/home_failure_app_bar_widget.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widget/home_is_first_time_widget.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widget/home_loading_widget.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widget/home_success_app_bar_widget.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widget/home_success_widget.dart';
import 'package:rent_home/feature/presentation/widgets/app_circular_progress_indicator.dart';
import 'package:rent_home/feature/presentation/widgets/app_shimmer_container.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../injection_container.dart';
import '../../../data/models/house/get_houses_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      create: (BuildContext context) {
        return bloc;
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: bloc..add(HomeLoadedEvent()),
        builder: (context, state) {
          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: AppColors.white,
                  centerTitle: false,
                  title: state is HomeSuccessState
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BounceInDown(
                              child: Text(
                                AppLocaleKeys.location,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: AppColors.grey83,
                                        fontSize: 12.sp),
                              ),
                            ),
                            BounceInUp(
                              child: Text(
                                state.currentLocation ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: AppColors.leadingColor,
                                        fontSize: 20.sp),
                              ),
                            ),
                          ],
                        ).paddingOnly(left: 20.w)
                      : state is HomeFailureState
                          ? HomeFailureAppBarWidget(
                              state: state,
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
                        ? HomeSuccessAppBarWidget(
                            state: state,
                          )
                        : state is HomeLoadingState
                            ? ShimmerContainer(h: 24.r, w: 24.r, r: 10.r)
                            : const AppCircularProgressIndicator(),
                  ],
                ),
                body: buildHomePageBody(state),
              ),
              if (state is HomeSuccessState && state.isFirstTime)
                HomeIsFirstTimeWidget(
                  bloc: bloc,
                  state: state,
                ),
            ],
          );
        },
      ),
    );
  }

  buildHomePageBody(HomeState state) {
    if (state is HomeSuccessState) {
      List<House>? houses = state.housesResponse.house;
      return HomeSuccessWidget(bloc: bloc, houses: houses);
    }

    if (state is HomeFailureState) {
      return const AppCircularProgressIndicator();
    }

    if (state is HomeLoadingState) {
      return const HomeLoadingWidget();
    }

    return const AppCircularProgressIndicator();
  }
}



