import 'package:flutter/material.dart';

class HomeNavigationItem {
  final Widget icon;
  final String title;
  final String tabName;
  final Widget screen;

  HomeNavigationItem({
    required this.icon,
    required this.title,
    required this.tabName,
    required this.screen,
  });
}
