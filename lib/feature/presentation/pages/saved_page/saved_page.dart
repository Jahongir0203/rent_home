import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_lotties.dart';
import 'package:rent_home/core/utils/app_locale_keys.dart';
import 'package:rent_home/feature/presentation/bloc/saved_bloc/saved_bloc.dart';
import 'package:rent_home/feature/presentation/widgets/app_shimmer_container.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../injection_container.dart';
import '../../../data/models/house/get_houses_response.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  final bloc = sl<SavedBloc>();

  @override
  void didChangeDependencies() {
    bloc.add(SavedLoadedEvent());

    super.didChangeDependencies();
  }

  @override
  void initState() {
    bloc.add(SavedLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(SavedLoadedEvent()),
      child: BlocBuilder<SavedBloc, SavedState>(
        bloc: bloc..add(SavedLoadedEvent()),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation:2 ,
              shadowColor: AppColors.white,
              backgroundColor: AppColors.white,
              centerTitle: false,
              title: FadeInDown(
                child: Text(
                  AppLocaleKeys.saved,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: AppColors.leadingColor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            body: buildBody(state, context).paddingSymmetric(horizontal: 20.w),
          );
        },
      ),
    );
  }

  Widget buildBody(SavedState state, BuildContext context) {
    if (state is SavedSuccessState) {
      return RefreshIndicator(
        onRefresh: () async {
          bloc.add(SavedLoadedEvent());
        },
        color: AppColors.mainColor,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: 0.8,
          ),
          itemCount: state.houses.length ?? 0,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                final house = state.houses[index];
                Navigator.pushNamed(
                  context,
                  Routes.detail,
                  arguments: House(
                    updatedAt: house.updatedAt,
                    topStatus: house.topStatus,
                    squareFootage: house.squareFootage,
                    roommateCount: house.roommateCount,
                    propertyType: house.propertyType,
                    ownerId: house.ownerId,
                    longitude: house.longitude,
                    listingStatus: house.listingStatus,
                    leaseTerms: house.leaseTerms,
                    leaseDuration: house.leaseDuration,
                    latitude: house.latitude,
                    imageUrl: house.imageUrl,
                    createdAt: house.createdAt,
                    bedrooms: house.bedrooms,
                    bathrooms: house.bathrooms,
                    address: house.address,
                    description: house.description,
                    price: house.price,
                    id: house.id,
                  ),
                );
              },
              splashColor: AppColors.grey83,
              borderRadius: BorderRadius.circular(20.r),
              child: Ink(
                height: 350.h,
                width: 222.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Stack(
                  children: [
                   index%2==1? FadeInRight(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          image: DecorationImage(
                              image: NetworkImage(state
                                      .houses[index].imageUrl?[0] ??
                                  "https://i.pinimg.com/originals/26/58/06/265806abb62c82c7cfdaeb097d5245d2.jpg"),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ):FadeInLeft(
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20.r),
                         image: DecorationImage(
                             image: NetworkImage(state
                                 .houses[index].imageUrl?[0] ??
                                 "https://i.pinimg.com/originals/26/58/06/265806abb62c82c7cfdaeb097d5245d2.jpg"),
                             fit: BoxFit.fill),
                       ),
                     ),
                   ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FadeIn(
                              child: Container(
                                width: 34.r,
                                height: 34.r,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(
                                      0.7), // Semi-transparent grey background
                                ),
                                child: FadeIn(
                                  child: IconButton(
                                    icon: Icon(Icons.bookmark,
                                        size: 20.r, color: AppColors.mainColor),
                                    onPressed: () {
                                      bloc.add(SavedFalseEvent(
                                          house: state.houses[index]));
                                    },
                                  ),
                                ),
                              ).paddingOnly(top: 10.r, right: 10.r),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInUp(
                              child: Text(
                                state.houses[index].address ?? "Address",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                            FadeInDown(
                              child: Text(
                                "${state.houses[index].squareFootage ?? 85} M2",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        fontSize: 12.sp,
                                        color: AppColors.colorD7),
                              ),
                            ),
                          ],
                        ).paddingOnly(left: 20.w, bottom: 16.h)
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
    if (state is SavedEmptyState) {
      return Center(
        child: Column(
          children: [
            Lottie.asset(
              AppLotties.empty,
              repeat: false,
            ),
            FadeInUp(
              child: Text(
                AppLocaleKeys.empty,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 25.sp),
              ),
            ),
          ],
        ),
      );
    }

    if (state is SavedFailureState) {
      return FadeIn(
        child: Center(
          child: Text(
            state.failure,
            style:
                Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 27),
          ),
        ),
      );
    }

    if (state is SavedLoadingState) {
      return Shimmer.fromColors(
        baseColor: AppColors.baseColor.shade300,
        highlightColor: AppColors.highlightColor.shade100,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: 0.8,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Ink(
              height: 350.h,
              width: 222.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: const ShimmerContainer(),
            );
          },
        ),
      );
    }

    return const SizedBox();
  }
}
