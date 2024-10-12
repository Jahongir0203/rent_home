import 'package:flutter/material.dart';
import 'package:rent_home/feature/presentation/pages/detail_product_page/detail_product_page.dart';
import 'package:rent_home/feature/presentation/pages/home_page/home_page.dart';
import 'package:rent_home/feature/presentation/pages/onboarding_page/onboarding_page.dart';
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
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
