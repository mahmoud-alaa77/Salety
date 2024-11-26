import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/features/local_notification_helper.dart';
import 'package:task1intern/main.dart';

class FirebaseNotification {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    String? token = await firebaseMessaging.getToken();

    print("Token refreshed: $token");

    setupMessageHandlers();
  }

  void handleMessage(RemoteMessage? message) {
    if (message != null) {
      navigatorKey.currentContext
          ?.pushNamed(Routes.notificationsScreen, arguments: message);
    }
  }

  void setupMessageHandlers() {
    // notification when the app is launched by a message
    firebaseMessaging.getInitialMessage().then(handleMessage);

    // notification when the app is opened from the background
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    // foreground notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        
        NotificationHelper.showNotification(
          title: message.notification!.title ?? 'No Title',
          body: message.notification!.body ?? 'No Body',
        );
      }
    });
  }
}

// Background message handler (global scope)
Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
 if (message.notification != null) {
    final title = message.notification!.title ?? 'No Title';
    final body = message.notification!.body ?? 'No Body';

    // استدعاء الإشعار المحلي
    NotificationHelper.showNotification(title: title, body: body);
  }}
