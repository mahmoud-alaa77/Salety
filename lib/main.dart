import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task1intern/core/di/di.dart';
import 'package:task1intern/core/helper/bloc_observer.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/shared_pref_helpers.dart';
import 'package:task1intern/core/routing/router.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/features/cart/data/models/hive_product_cart.dart';
import 'package:task1intern/features/local_notification_helper.dart';
import 'package:task1intern/firebase_notificathion_helper.dart';
import 'package:task1intern/firebase_options.dart';

bool isLoggedInUser = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await checkIfLoggedInUser();

  await Hive.initFlutter();
  Hive.registerAdapter(HiveProductCartAdapter());

  await Hive.openBox('cart');

  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseNotification().initNotification();
  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);
  await NotificationHelper.initialize();
  await setupGetIt();
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
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
        initialRoute: isLoggedInUser ? Routes.mainScreen : Routes.splashScreen,
        onGenerateRoute: appRouter.genrateRoute,
      ),
    );
  }
}

checkIfLoggedInUser() async {
  String userToken = await SharedPrefHelper.getString('token');
  log(userToken.toString());
  // ignore: unnecessary_null_comparison
  if (!userToken.isNullOrEmpty() ) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
    log(isLoggedInUser.toString());

}
