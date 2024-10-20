import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/router/app_routes.dart';
import 'package:rent_home/feature/data/models/category_model.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/home_app_bar_item.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/home_best_for_item.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/home_category_tab_item.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/home_drawer.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/home_item_opasicty.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/home_near_from_item.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/home_near_item_title.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/home_notifaction_icon.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/home_on_tap_button.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/home_search_item.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/home_show_title.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: categories.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        title: const HomeAppBarItem(),
        actions: [
          HomeNotifacationIcon(onTap: () {
            Navigator.pushNamed(context, Routes.notifacation);
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            14.getH(),
            SizedBox(
              height: 38.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.7,
                    child: HomeSearchItem(
                      onChangeValue: (value) {},
                    ),
                  ),
                  HomeOnTapButton(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.settings);
                    },
                  ),
                ],
              ),
            ),
            14.getH(),
            HomeCategoryTabItem(
              tabController: _tabController,
              onChangeValue: (value) {},
            ),
            14.getH(),
            HomeShowTitle(
              onTap: () {},
              title: "Near from you",
            ),
            14.getH(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) {
                    return ZoomTapAnimation(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.detailProductPage);
                      },
                      child: const Stack(
                        children: [
                          HomeNearFromItem(),
                          HomeItemOpasicty(),
                          HomeNearItemTitle(),
                        ],
                      ).paddingOnly(right: 20.w),
                    );
                  },
                ),
              ),
            ),
            14.getH(),
            HomeShowTitle(
              onTap: () {},
              title: "Best for you",
            ),
            14.getH(),
            ...List.generate(
              6,
              (index) {
                return HomeBestForItem(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.detailProductPage);
                  },
                );
              },
            ),
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}
