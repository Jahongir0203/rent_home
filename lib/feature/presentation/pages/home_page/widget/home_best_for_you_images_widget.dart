import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';

import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_svg.dart';
import '../../../../data/models/house/get_houses_response.dart';
import '../../../widgets/app_widgets.dart';

class BestForYouImagesWidget extends StatelessWidget {
  List<House>? houses;

  BestForYouImagesWidget({super.key, required this.houses});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.detail,
                arguments: houses![index]);
          },
          splashColor: AppColors.grey83.withOpacity(0.3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElasticInDown(
                child: Container(
                  height: 70.r,
                  width: 74.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://static.vecteezy.com/system/resources/thumbnails/023/308/330/small_2x/ai-generative-exterior-of-modern-luxury-house-with-garden-and-beautiful-sky-photo.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BounceInUp(
                    child: Text(
                      houses![index].propertyType ?? "Orchard House",
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.leadingColor),
                    ),
                  ),
                  BounceInRight(
                    child: Text(
                      " ${houses![index].price ?? 2500000} so'm/oy",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: AppColors.mainColor, fontSize: 12.sp),
                    ).paddingOnly(top: 8.h, bottom: 5.h),
                  ),
                  ZoomIn(
                    child: Row(
                      children: [
                        Row(
                          children: [
                            AppWidgets.imageSvg(path: AppSvg.icBedDark)
                                .paddingOnly(right: 8.w),
                            Text(
                              '${houses![index].bedrooms ?? 6}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontSize: 12.sp, color: AppColors.grey85),
                            ).paddingOnly(right: 2.w),
                            Text(
                              'Bedroom',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontSize: 12.sp, color: AppColors.grey85),
                            ),
                          ],
                        ).paddingOnly(right: 19.w),
                        Row(
                          children: [
                            AppWidgets.imageSvg(path: AppSvg.icBathDark)
                                .paddingOnly(right: 8.w),
                            Text(
                              '${houses![index].bathrooms ?? 8}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontSize: 12.sp, color: AppColors.grey85),
                            ).paddingOnly(right: 2.w),
                            Text(
                              'Bathroom',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontSize: 12.sp, color: AppColors.grey85),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ).paddingOnly(left: 20.w),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 24.h,
        );
      },
      itemCount: 10,
    );
  }
}
