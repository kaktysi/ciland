import 'package:ciland/features/home/models/home_navigation_item.dart';
import 'package:ciland/features/home/widgets/home_navigation_item.dart';
import 'package:flutter/material.dart';

class NavigationDrawerLeft extends StatelessWidget {
  const NavigationDrawerLeft({super.key, required this.navItems});

  final List<HomeNavigationItem> navItems;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Center(child: CircleAvatar(radius: 52)),
                Text('Guest', style: TextStyle(fontSize: 28)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: navItems.length,
              itemBuilder: (context, index) {
                return HomeNavigationItemDrawer(item: navItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
