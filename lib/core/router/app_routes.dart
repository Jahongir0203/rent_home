import 'package:flutter/material.dart';
import 'package:rent_home/feature/presentation/pages/home_page/home_page.dart';
import 'package:rent_home/feature/presentation/pages/log_in_page/log_in_page.dart';
import 'package:rent_home/feature/presentation/pages/reset_password_page/reset_password_page.dart';
import 'package:rent_home/feature/presentation/pages/sign_up_page/sign_up_page.dart';

import '../../feature/presentation/pages/splash_page/splash_page.dart';

part 'name_route.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => SplashPage(),
        );

      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => SignUpPage(),
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => LogInPage(),
        );

      case Routes.resetPassword:
        return MaterialPageRoute(
          builder: (context) => ResetPasswordPage(),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
    }
    return null;
  }
}
