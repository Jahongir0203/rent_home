import 'package:flutter/material.dart';
import 'package:rent_home/feature/presentation/pages/log_in_page/log_in_page.dart';
import 'package:rent_home/feature/presentation/pages/reset_password_page/reset_password_page.dart';
import 'package:rent_home/feature/presentation/pages/sign_up_page/sign_up_page.dart';

import '../../feature/presentation/pages/drawer_page/drawer_page.dart';
import '../../feature/presentation/pages/help_page/help_page.dart';
import '../../feature/presentation/pages/home_page/home_page.dart';
import '../../feature/presentation/pages/message_page/message_page.dart';
import '../../feature/presentation/pages/nearby_page/nearby_page.dart';
import '../../feature/presentation/pages/notifacation_page/notification_page.dart';
import '../../feature/presentation/pages/profile_page/profile_page.dart';
import '../../feature/presentation/pages/saved_page/saved_page.dart';
import '../../feature/presentation/pages/settings_page/settings_page.dart';
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

      case Routes.drawer:
        return MaterialPageRoute(
          builder: (context) => DrawerPage(),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );

      case Routes.profile:
        return MaterialPageRoute(
          builder: (context) => ProfilePage(),
        );

      case Routes.nearby:
        return MaterialPageRoute(
          builder: (context) => NearbyPage(),
        );
      case Routes.saved:
        return MaterialPageRoute(
          builder: (context) => SavedPage(),
        );

      case Routes.notification:
        return MaterialPageRoute(
          builder: (context) => NotificationPage(),
        );

      case Routes.message:
        return MaterialPageRoute(
          builder: (context) => MessagePage(),
        );

      case Routes.settings:
        return MaterialPageRoute(
          builder: (context) => SettingsPage(),
        );

      case Routes.help:
        return MaterialPageRoute(
          builder: (context) => HelpPage(),
        );
    }
    return null;
  }
}
