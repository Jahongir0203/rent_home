import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_text_style.dart';
import 'package:rent_home/feature/data/models/category_model.dart';

class HomeCategoryTabItem extends StatelessWidget {
  const HomeCategoryTabItem({
    super.key,
    required TabController tabController,
    required this.onChangeValue,
  }) : _tabController = tabController;

  final TabController _tabController;
  final ValueChanged<int> onChangeValue;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onChangeValue,
      dividerColor: AppColors.transparent,
      unselectedLabelStyle: AppTextStyle.w500H16.copyWith(color: AppColors.black),
      labelStyle: AppTextStyle.w500H16,
      labelColor: AppColors.white,
      isScrollable: true,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.linerGradient1,
            AppColors.linerGradient2,
          ],
        ),
      ),
      controller: _tabController,
      tabs: List.generate(
        categories.length,
        (index) {
          return Text(
            categories[index].name,
            selectionColor: AppColors.white,
          ).paddingSymmetric(horizontal: 12.w, vertical: 6.h);
        },
      ),
    );
  }
}
