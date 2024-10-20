import 'package:flutter/material.dart';
import 'package:rent_home/feature/presentation/pages/bookmark_page/bookmark_page.dart';
import 'package:rent_home/feature/presentation/pages/detail_product_page/detail_product_page.dart';
import 'package:rent_home/feature/presentation/pages/home_page/home_page.dart';
import 'package:rent_home/feature/presentation/pages/massage_page/massage_page.dart';
import 'package:rent_home/feature/presentation/pages/nearby_page/nearby_page.dart';
import 'package:rent_home/feature/presentation/pages/notifaction_page/notifaction_page.dart';
import 'package:rent_home/feature/presentation/pages/profile_page/profile_page.dart';
import 'package:rent_home/feature/presentation/pages/settings_page/settings_page.dart';

part 'name_route.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case Routes.detailProductPage:
        return MaterialPageRoute(builder: (context) => const DetailProductPage());
      case Routes.profile:
        return MaterialPageRoute(builder: (context) => const ProfilePage());
      case Routes.nearby:
        return MaterialPageRoute(builder: (context) => const NearbyPage());
      case Routes.bookmark:
        return MaterialPageRoute(builder: (context) => const BookmarkPage());
      case Routes.notifacation:
        return MaterialPageRoute(builder: (context) => const NotifactionPage());
      case Routes.massage:
        return MaterialPageRoute(builder: (context) => const MassagePage());
      case Routes.settings:
        return MaterialPageRoute(builder: (context) => const SettingsPage());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
