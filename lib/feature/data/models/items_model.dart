import 'package:flutter/material.dart';

import '../../../core/utils/app_locale_keys.dart';

class ListViewItems {
  final IconData icon;
  final String title;
  final Function onTap;

  ListViewItems({required this.icon, required this.title, required this.onTap});
}

List<ListViewItems> items = [
  ListViewItems(
      icon: Icons.shopping_bag, title: AppLocaleKeys.orders, onTap: () {}),
  ListViewItems(icon: Icons.comment, title: AppLocaleKeys.commit, onTap: () {})
];

List<ListViewItems> items1 = [
  ListViewItems(
      icon: Icons.credit_card, title: AppLocaleKeys.card, onTap: () {}),
  ListViewItems(
      icon: Icons.location_on_outlined,
      title: AppLocaleKeys.myLoc,
      onTap: () {}),
];
