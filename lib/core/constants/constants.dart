import 'package:flutter/material.dart';
import 'package:rent_home/feature/presentation/pages/help_page/help_page.dart';
import 'package:rent_home/feature/presentation/pages/home_page/home_page.dart';
import 'package:rent_home/feature/presentation/pages/nearby_page/nearby_page.dart';
import 'package:rent_home/feature/presentation/pages/notifacation_page/notification_page.dart';
import 'package:rent_home/feature/presentation/pages/profile_page/profile_page.dart';
import 'package:rent_home/feature/presentation/pages/saved_page/saved_page.dart';

import '../../feature/presentation/pages/message_page/message_page.dart';
import '../../feature/presentation/pages/settings_page/settings_page.dart';

sealed class Constants {
  static const authUrl = "http://3.120.40.35:5555/auth";
  static const baseUrl = "http://3.120.40.35:9996";

  ///Auth
  static const register = "/register";
  static const logIn = "/login";
  static const logOut = "/logout";
  static const forgotPassword = "/forgot-password";
  static const refreshToken = "/refresh-token";
  static const resetPassword = "/reset-password";
  static const validateToken = "/validate-token";

  /// House

  static const deleteHouse = "/properties/propertiesdelete/";
  static const getHouseById = "/properties/propertiesgetbyid/";
  static const getHouse = "/properties/propertiesgetall/100/1";
  static const updateHouse = "properties/propertiesupdate";
  static const createHouse = "/properties/propertiescreate";
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
  "Bildirishnoma",
  "Xabar",
  "Sozlamalar",
  "Yordam",
  "Chiqish"
];

var listPages = [
  const HomePage(),
  const ProfilePage(),
  const NearbyPage(),
  const SavedPage(),
  NotificationPage(),
  const MessagePage(),
  const SettingsPage(),
  const HelpPage(),
];

var listCategory = ["Uy", "Kvartira", "Mehmonxona", "Villa"];
