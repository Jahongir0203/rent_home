import 'package:flutter/material.dart';
import 'package:rent_home/core/theme/theme.dart';
import 'package:rent_home/feature/data/models/drawer_model.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/home_drawer_item.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  int isChangeValue = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.c0A8ED9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          drawerItems.length,
          (index) {
            return HomeDrawerItem(
              item: drawerItems[index],
            );
          },
        ),
      ),
    );
  }
}
