import 'dart:developer';

import 'package:ciland/repositories/noticification_repository/abstract_noticification_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AbstractNotificationRepository)
class FirebaseNotificationRepository
    extends AbstractNotificationRepository {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  @override
  Future<void> initialize() async {
    await _messaging.requestPermission();

    final fcmToken = await _messaging.getToken();
    log("FCM Token: $fcmToken");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("Received notification: ${message.notification?.title}");
    });
  }
}
