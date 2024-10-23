import 'package:flutter/material.dart';
import 'package:rent_home/feature/presentation/pages/help_page/help_page.dart';
import 'package:rent_home/feature/presentation/pages/home_page/home_page.dart';
import 'package:rent_home/feature/presentation/pages/nearby_page/nearby_page.dart';
import 'package:rent_home/feature/presentation/pages/notifacation_page/notification_page.dart';
import 'package:rent_home/feature/presentation/pages/profile_page/profile_page.dart';
import 'package:rent_home/feature/presentation/pages/saved_page/saved_page.dart';

import '../../feature/presentation/pages/message_page/message_page.dart';
import '../../feature/presentation/pages/settings_page/settings_page.dart';
import '../router/app_routes.dart';

sealed class Constants {
  static const authUrl = "http://3.120.40.35:5555/auth";

  static const register = "/register";
  static const logIn = "/login";
  static const logOut = "/logout";
  static const forgotPassword = "/forgot-password";
  static const refreshToken = "/refresh-token";
  static const resetPassword = "/reset-password";
  static const validateToken = "/validate-token";
}

const listIconsData = [
  Icons.home,
  Icons.person,
  Icons.location_on_outlined,
  Icons.bookmark_border,
  Icons.notifications_none,
  Icons.messenger_outline,
  Icons.settings,
  Icons.help_outline,
  Icons.logout
];

const listTitle = [
  "Bosh sahifa",
  "Kabinet",
  "Yaqin-atrofda",
  "Saqlangan",
  "Bildirishnima",
  "Xabar",
  "Sozlamalar",
  "Yordam",
  "Chiqish"
];

var listPages = [
  HomePage(),
  const ProfilePage(),
  const NearbyPage(),
  const SavedPage(),
  const NotificationPage(),
  const MessagePage(),
  const SettingsPage(),
  const HelpPage(),
];

var listCategory=[
  "Uy",
  "Kvartira",
  "Mehmonxona",
  "Villa"
];