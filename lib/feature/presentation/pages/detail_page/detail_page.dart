import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/feature/presentation/pages/detail_page/widget/detail_description_title_widget.dart';
import 'package:rent_home/feature/presentation/pages/detail_page/widget/detail_gallery_images_widget.dart';
import 'package:rent_home/feature/presentation/pages/detail_page/widget/detail_gallery_title_widget.dart';
import 'package:rent_home/feature/presentation/pages/detail_page/widget/detail_image_widget.dart';
import 'package:rent_home/feature/presentation/pages/detail_page/widget/detail_maps_widget.dart';
import 'package:rent_home/feature/presentation/pages/detail_page/widget/detail_owner_info_widget.dart';
import 'package:rent_home/feature/presentation/pages/detail_page/widget/detail_read_more_widget.dart';
import 'package:rent_home/feature/presentation/pages/detail_page/widget/detail_rent_now_widget.dart';

import '../../../../core/theme/app_colors.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  final ScrollController controller = ScrollController();
  Marker marker = const Marker(
    markerId: MarkerId('1'),
    position: LatLng(49.9, 69.1),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ImageWidget(),
                    const DescriptionTitleWidget()
                        .paddingSymmetric(vertical: 20.h),
                    const ReadMoreWidget().paddingOnly(bottom: 24.h),
                    const OwnerInfoWidget().paddingOnly(bottom: 32.h),
                    const GalleryTitleWidget().paddingOnly(bottom: 20.h),
                    const GalleryImagesWidget().paddingOnly(bottom: 32.h),
                    const MapsWidget(),
                  ],
                ).paddingOnly(
                  left: 20.w,
                  right: 20.w,
                ),
              ),
            ),
            const RentNowWidget(),
          ],
        ),
      ),
    );
  }
}
