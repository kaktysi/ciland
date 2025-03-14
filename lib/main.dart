import 'package:ciland/ci_land_app.dart';
import 'package:ciland/di.dart';
import 'package:ciland/repositories/noticification_repository/abstract_noticification_repository.dart';
import 'package:ciland/router/router.dart';
import 'package:ciland/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await configureDependencies();
  usePathUrlStrategy();

  if (!kIsWeb) await getIt<AbstractNotificationRepository>().initialize();

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => AppRouter()),
        ChangeNotifierProvider(create: (context) => ThemeChange()),
      ],
      child: CiLandApp(),
    ),
  );
}
