import 'package:flutter/material.dart';
import 'package:rent_home/feature/presentation/pages/bookmark/bookmark_page.dart';
import 'package:rent_home/feature/presentation/pages/detail_product_page/detail_product_page.dart';
import 'package:rent_home/feature/presentation/pages/home_page/home_page.dart';
import 'package:rent_home/feature/presentation/pages/massage/massage_page.dart';
import 'package:rent_home/feature/presentation/pages/nearby/nearby_page.dart';
import 'package:rent_home/feature/presentation/pages/notifaction/notifaction_page.dart';
import 'package:rent_home/feature/presentation/pages/onboarding_page/onboarding_page.dart';
import 'package:rent_home/feature/presentation/pages/profile/profile_page.dart';
import 'package:rent_home/feature/presentation/pages/settings/settings_page.dart';
import 'package:rent_home/feature/presentation/pages/sign_in_page/sign_in_page.dart';
import 'package:rent_home/feature/presentation/pages/sign_up_page/sign_up_page.dart';
import 'package:rent_home/feature/presentation/pages/splash_page/splash_page.dart';

part 'name_route.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (context) => const OnboardingPage());
      case Routes.signUpPage:
        return MaterialPageRoute(builder: (context) => const SignUpPage());
      case Routes.signInPage:
        return MaterialPageRoute(builder: (context) => const SignInPage());
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
