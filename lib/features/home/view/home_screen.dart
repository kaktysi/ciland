import 'package:ciland/features/movies/models/movie_type.dart';
import 'package:ciland/features/movies/view/movie_screen.dart';
import 'package:ciland/features/home/models/home_navigation_item.dart';
import 'package:ciland/features/home/widgets/navigation_drawer_left.dart';
import 'package:ciland/theme/theme.dart';
import 'package:ciland/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
      icon: const Icon(Icons.tv),
      title: 'Films',
      tabName: 'films',
      screen: const MovieScreen(movieType: MovieType.movie),
    ),
    HomeNavigationItem(
      icon: const Icon(Icons.tv_off_rounded),
      title: 'Series',
      tabName: 'series',
      screen: const MovieScreen(movieType: MovieType.tvSeries),
    ),
    HomeNavigationItem(
      icon: const Icon(Icons.help_center_rounded),
      title: 'Help',
      tabName: 'help',
      screen: const Scaffold(),
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
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.wb_sunny_outlined),
            onPressed: () {
              Provider.of<ThemeChange>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: Provider.of<ThemeChange>(context),
        builder: (context, child) {
          return Theme(data: ThemeApp.theme, child: child ?? const SizedBox());
        },
        child: Stack(children: [_fragmentPage()]),
      ),
      drawer: NavigationDrawerLeft(navItems: _navItems),
      bottomNavigationBar:
          context.isMobileView
              ? SizedBox(
                height:
                    MediaQuery.of(context).viewInsets.bottom > 10 ? 0 : null,
                child: BottomNavigationBar(
                  key: const Key('bottomNavigationBar'),
                  items: [
                    _bottomNavigationItem(name: 'Films', icon: Icons.tv),
                    _bottomNavigationItem(
                      name: 'Series',
                      icon: Icons.tv_off_rounded,
                    ),
                    _bottomNavigationItem(
                      name: 'Help',
                      icon: Icons.help_center_rounded,
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  showUnselectedLabels: true,
                  onTap: (index) {
                    setState(() {
                      _changeIndex(index);
                    });
                  },
                ),
              )
              : null,
    );
  }

  void _changeIndex(int index) {
    _selectedIndex = index;
    switch (index) {
      case 0:
        context.go('/home/films');
        break;
      case 1:
        context.go('/home/series');
        break;
      case 2:
        context.go('/home/help');
        break;
    }
  }
}

BottomNavigationBarItem _bottomNavigationItem({
  required String name,
  required IconData icon,
}) {
  return BottomNavigationBarItem(
    icon: Icon(
      icon,
      color: ThemeApp.themeAppIsDark() ? Colors.white : Colors.black,
    ),
    label: name,
    activeIcon: Icon(icon, color: Colors.amber),
    backgroundColor: ThemeApp.theme.bottomNavigationBarTheme.backgroundColor,
  );
}
