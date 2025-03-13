import 'package:ciland/router/router.dart';
import 'package:ciland/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CiLandApp extends StatelessWidget {
  const CiLandApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = Provider.of<AppRouter>(context).router;
    return Consumer<ThemeChange>(
      builder: (context, themeChange, child) => 
      MaterialApp.router(
        theme: themeChange.theme,
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
