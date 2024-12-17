import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/di/di.dart';
import 'package:task1intern/core/routing/router.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/features/local_notification_helper.dart';
import 'package:task1intern/firebase_notificathion_helper.dart';
import 'package:task1intern/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseNotification().initNotification();
  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);
  await NotificationHelper.initialize();
  await setupGetIt();
  runApp(
    DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(
              appRouter: AppRouter(),
            )),
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      ensureScreenSize: true,
      splitScreenMode: true,
      designSize: const Size(392, 872),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: "Almarai"),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
        ],
        initialRoute: Routes.splashScreen,
        onGenerateRoute: appRouter.genrateRoute,
      ),
    );
  }
}
