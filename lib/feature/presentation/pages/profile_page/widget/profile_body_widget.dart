
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../data/models/items_model.dart';

class ProfileCustomBodyWidget extends StatelessWidget {
  const ProfileCustomBodyWidget({
    super.key,
    required this.items,
  });

  final List<ListViewItems> items;

  @override
  Widget build(BuildContext context) {
    return BounceInLeft(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.cGRAY2, width: 1.6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0.1),
            ),
          ],
          borderRadius: BorderRadius.circular(12.w),
          color: AppColors.white,
        ),
        child: Center(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Material(
                color: AppColors.transparent,
                child: InkWell(
                  splashColor: AppColors.baseColor.shade100,
                  highlightColor: AppColors.mainColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    items[index].onTap;
                  },
                  child: BounceInRight(
                    child: Row(  
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: BounceInRight(
                            child: Icon(
                              items[index].icon,
                              color: AppColors.grey83.withOpacity(0.8),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: BounceInRight(
                            child: Text(
                              items[index].title,
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                  color: AppColors.cGRAY4.withOpacity(0.6),
                                  fontSize: 22.r,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Expanded(
                          child: BounceInRight(
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.chevron_right_outlined,
                                color: AppColors.cGRAY4.withOpacity(0.6),
                              ),
                            ).paddingOnly(right: 5.w),
                          ),
                        ),
                      ],
                    ).paddingOnly(top: 15.h, bottom: 15.h),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 1.6,
                color: AppColors.cGRAY2,
              );
            },
          ),
        ),
      ),
    );
  }
}

