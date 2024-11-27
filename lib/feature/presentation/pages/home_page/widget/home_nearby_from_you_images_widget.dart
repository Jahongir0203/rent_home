import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/services/storage_service.dart';
import 'package:rent_home/feature/data/models/position_model.dart';

import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_png.dart';
import '../../../../../injection_container.dart';
import '../../../../data/models/house/get_houses_response.dart';

class NearFromYouImagesWidget extends StatefulWidget {
  List<House>? houses;

  NearFromYouImagesWidget({super.key, required this.houses});

  @override
  State<NearFromYouImagesWidget> createState() => _NearFromYouImagesWidgetState();
}

class _NearFromYouImagesWidgetState extends State<NearFromYouImagesWidget> {
  StorageService storageService = sl<StorageService>();

  Future<String> calculateDistance(double? lat, double? long) async {
    PositionModel? positionModel = await storageService.getCurrentPosition();
    double distanceInMeters = Geolocator.distanceBetween(
      positionModel?.latitude ?? 69.2, // Latitude of point 1
      positionModel?.longitude ?? 77.5946, // Longitude of point 1
      lat ?? 69.21, // Latitude of point 2
      long ?? 77.5946, // Longitude of point 2
    );

    print("Distance: ${(distanceInMeters / 1000).toStringAsFixed(2)} km");
    return '${(distanceInMeters / 1000).toStringAsFixed(2)} km';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 272.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.houses?.length ?? 0,
        itemBuilder: (context, index) {
          String? distance;
          // calculateDistance(widget.houses![index].latitude?.toDouble(),
          //         widget.houses![index].longitude!.toDouble())
          //     .then(
          //   (value) {
          //     setState(() {
          //       distance = value;
          //     });
          //   },
          // );

          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.detail,
              arguments: widget.houses![index]
              );
            },
            borderRadius: BorderRadius.circular(20.r),
            child: Ink(
              height: 272.h,
              width: 222.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://i.pinimg.com/originals/26/58/06/265806abb62c82c7cfdaeb097d5245d2.jpg"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: AppColors.leadingColor.withOpacity(0.24),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColors.white,
                              size: 10.r,
                            ).paddingOnly(right: 2.w),
                            Text(
                              distance?? "1.8 km",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: AppColors.white, fontSize: 12.sp),
                            )
                          ],
                        ).paddingSymmetric(horizontal: 3.w),
                      ).paddingOnly(top: 20.h, left: 140.w, right: 16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.houses![index].address ?? "Address",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            widget.houses![index].leaseTerms ??
                                "JL. Sulan Iskandar Muda",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 12.sp, color: AppColors.colorD7),
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
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 24.w,
          );
        },
      ),
    );
  }
}
