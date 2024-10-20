import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_text_style.dart';
import 'package:rent_home/feature/presentation/pages/detail_product_page/widgets/detail_bottom_widget.dart';
import 'package:rent_home/feature/presentation/pages/detail_product_page/widgets/detail_title.dart';
import 'package:rent_home/feature/presentation/pages/detail_product_page/widgets/detail_gallery_item.dart';
import 'package:rent_home/feature/presentation/pages/detail_product_page/widgets/detail_user_data_and_connecting.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DetailTitle(),
            10.getH(),
            Text(
              "Description",
              style: AppTextStyle.w500H16,
            ),
            10.getH(),
            Text(
              "The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars... Show More",
              style: AppTextStyle.w400H12.copyWith(color: AppColors.c858585),
            ),
            10.getH(),
            const DetailUserDataAndConnecting(),
            10.getH(),
            Text(
              "Gallery",
              style: AppTextStyle.w500H16,
            ),
            10.getH(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(5, (index) {
                  return const DetailGalleryItem();
                }),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
      ),
      floatingActionButton: const DetailBottomWidget().paddingSymmetric(horizontal: 20.w),
    );
  }
}
