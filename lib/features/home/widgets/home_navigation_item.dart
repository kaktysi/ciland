import 'package:ciland/features/home/models/home_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeNavigationItemDrawer extends StatelessWidget {
  final HomeNavigationItem item;
  const HomeNavigationItemDrawer({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title, style: TextStyle(fontSize: 18)),
      leading: item.icon,
      onTap: () {
        Navigator.of(context).pop();
        context.go('/home/${item.tabName}');
      },
    );
  }
}
