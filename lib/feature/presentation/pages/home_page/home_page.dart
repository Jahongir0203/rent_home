import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/app_bar_item.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/best_for/best_for_item.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/category_item.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/item_opasicty.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/near_from_item.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/near_item_title.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/notifaction_icon.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/on_tap_button.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/search_item.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/show_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int changeValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const AppBarItem(),
        actions: [
          NotifacationIcon(onTap: () {}),
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
                    child: SearchItem(
                      onChangeValue: (value) {},
                    ),
                  ),
                  OnTapButton(
                    onTap: () {},
                  ),
                ],
              ),
            ),
            14.getH(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  6,
                  (index) {
                    return CategoryItem(
                        onTap: () {
                          changeValue = index;
                          setState(() {});
                        },
                        isSelectItem: changeValue == index);
                  },
                ),
              ),
            ),
            14.getH(),
            ShowTitle(
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
                    return const Stack(
                      children: [
                        NearFromItem(),
                        NearFromItemOpacity(),
                        NearFromItemTitle(),
                      ],
                    ).paddingOnly(right: 20.w);
                  },
                ),
              ),
            ),
            14.getH(),
            ShowTitle(
              onTap: () {},
              title: "Best for you",
            ),
            14.getH(),
            ...List.generate(
              6,
              (index) {
                return const BestForItem();
              },
            ),
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}
