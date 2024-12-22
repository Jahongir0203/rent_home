import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../data/models/house/get_houses_response.dart';

class ReadMoreWidget extends StatelessWidget {
   const ReadMoreWidget({
    super.key, required this.house,
  });
final House house;
  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: ReadMoreText(
       house.description?? 'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
        style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.leadingColor,
            fontFamily: "Raleway"),
        isExpandable: true,
        trimLength: 120,
        trimLines: 2,
        colorClickableText: AppColors.mainColor,
        // Ensure clickable text color is visible
        trimCollapsedText: 'Show more',
        trimExpandedText: 'Show less',
        lessStyle:
        Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12.sp),
        moreStyle:
        Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12.sp),
      ),
    );
  }
}
