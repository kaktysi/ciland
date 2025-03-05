import 'package:ciland/features/films/view/films_screen.dart';
import 'package:ciland/features/home/models/home_navigation_item.dart';
import 'package:ciland/features/home/widgets/navigation_drawer_left.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String tab;
  final Widget? child;

  const HomeScreen({super.key, required this.tab, this.child});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<HomeNavigationItem> _navItems = [
    HomeNavigationItem(
      icon: const Icon(Icons.apps_outlined),
      title: 'CILAND',
      tabName: 'ciland',
      screen: const FilmsScreen(),
    ),
    HomeNavigationItem(
      icon: const Icon(Icons.tv),
      title: 'Films',
      tabName: 'films',
      screen: const FilmsScreen(),
    ),
    HomeNavigationItem(
      icon: const Icon(Icons.tv_off_rounded),
      title: 'Series',
      tabName: 'series',
      screen: const Scaffold(),
    ),
    HomeNavigationItem(
      icon: const Icon(Icons.help_center_rounded),
      title: 'Help',
      tabName: 'help',
      screen: const FilmsScreen(),
    ),
  ];
  late final List<String> _navTabs;
  Widget? _child;
  int _selectedIndex = 0;

  @override
  void initState() {
    _navTabs = _navItems.map((e) => e.tabName).toList();
    if (_navTabs.contains(widget.tab)) {
      _selectedIndex = _navTabs.indexOf(widget.tab);
    }
    _child = widget.child;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    if (_navTabs.contains(widget.tab)) {
      _selectedIndex = _navTabs.indexOf(widget.tab);
    }
    _child = widget.child;
    if (_child == null) {}
    super.didUpdateWidget(oldWidget);
  }

  Widget _fragmentPage() {
    return IndexedStack(
      index: _child == null ? 0 : 1,
      children: [
        IndexedStack(
          index: _selectedIndex,
          children: _navItems.map((e) => e.screen).toList(growable: false),
        ),
        SizedBox(child: _child),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: Stack(children: [_fragmentPage()]),
      drawer: NavigationDrawerLeft(navItems: _navItems),
    );
  }
}
