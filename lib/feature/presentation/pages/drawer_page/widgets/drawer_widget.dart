import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/feature/presentation/bloc/drawer_page/drawer_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/theme/app_colors.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.selectedIndex,
    required this.bloc,
    required this.state,
  });

  final int selectedIndex;
  final DrawerBloc bloc;
  final DrawerState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: listIconsData.length,
          itemBuilder: (context, index) {
            return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? AppColors.white
                      : AppColors.mainColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    listIconsData[index],
                  ),
                  title: Text(
                    listTitle[index],
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Raleway",
                        color: selectedIndex == index
                            ? AppColors.mainColor
                            : AppColors.white),
                  ),
                  splashColor: AppColors.black12,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  )),
                  onTap: () {
                    bloc.add(DrawerLoadedEvent(index: index));
                    bloc.advancedDrawerController.hideDrawer();
                  },
                  iconColor: selectedIndex == index
                      ? AppColors.mainColor
                      : AppColors.white,
                  textColor: selectedIndex == index
                      ? AppColors.mainColor
                      : AppColors.white,
                ));
          },
          separatorBuilder: (BuildContext context, int index) {
            if (index == 2 || index == 5) {
              return SizedBox(
                height: 40.h,
                child: const Divider(
                  color: AppColors.white,
                ),
              );
            } else {
              return SizedBox(
                height: 12.h,
              );
            }
          },
        ),
      ],
    );
  }
}
