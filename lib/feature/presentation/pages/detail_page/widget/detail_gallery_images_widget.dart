import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_png.dart';

class GalleryImagesWidget extends StatelessWidget {
  const GalleryImagesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.r,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              height: 72.r,
              width: 72.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AppPng.img3),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 16.r,
          ),
          itemCount: 6),
    );
  }
}
