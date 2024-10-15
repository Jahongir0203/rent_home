import 'package:rent_home/core/constantas/form_status.dart';
import 'package:rent_home/core/router/app_routes.dart';
import 'package:rent_home/core/theme/app_svg.dart';

class DrawerModel {
  final String icon;
  final String title;
  final DrawerItemFormType type;
  String? routName;
  String? url;

  DrawerModel({
    required this.icon,
    required this.title,
    required this.type,
    this.routName,
    this.url,
  });
}

List<DrawerModel> drawerItems = [
  DrawerModel(type: DrawerItemFormType.routName, icon: AppSvg.icHome, title: "Home", routName: Routes.homePage),
  DrawerModel(type: DrawerItemFormType.routName, icon: AppSvg.icProfile, title: "Profile", routName: Routes.profile),
  DrawerModel(type: DrawerItemFormType.routName, icon: AppSvg.icNearby, title: "Nearby", routName: Routes.nearby),
  DrawerModel(type: DrawerItemFormType.routName, icon: AppSvg.icBookmark, title: "Bookmark", routName: Routes.bookmark),
  DrawerModel(type: DrawerItemFormType.routName, icon: AppSvg.icNotifacation, title: "Notification", routName: Routes.notifacation),
  DrawerModel(type: DrawerItemFormType.url, icon: AppSvg.icMassage, title: "Massage", url: "https://t.me/Muhriddinbek_off"),
  DrawerModel(type: DrawerItemFormType.routName, icon: AppSvg.icSettings, title: "Settings", routName: Routes.settings),
  DrawerModel(type: DrawerItemFormType.url, icon: AppSvg.icHelp, title: "Help", url: "https://t.me/Muhriddinbek_off"),
  DrawerModel(type: DrawerItemFormType.other, icon: AppSvg.icLogOut, title: "Logout"),
];
