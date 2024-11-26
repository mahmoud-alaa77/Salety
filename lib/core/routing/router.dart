import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/features/auth/forget_password/ui/check_phone_screen.dart';
import 'package:task1intern/features/auth/forget_password/ui/forget_password_screen.dart';
import 'package:task1intern/features/auth/forget_password/ui/otp_screen.dart';
import 'package:task1intern/features/auth/forget_password/ui/password_changed_screen.dart';
import 'package:task1intern/features/auth/main_auth_screen.dart';
import 'package:task1intern/features/auth/login/ui/login_screen.dart';
import 'package:task1intern/features/home/ui/main_screen.dart';
import 'package:task1intern/features/home/ui/screens/all_categories_screen.dart';
import 'package:task1intern/features/home/ui/screens/shoping_cart_screen.dart';
import 'package:task1intern/features/home/ui/screens/one_category_screen.dart';
import 'package:task1intern/features/notifications/ui/notifictions_screen.dart';
import 'package:task1intern/features/onboarding/ui/onboarding_screen.dart';
import 'package:task1intern/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:task1intern/features/payment/ui/order_address_screen.dart';
import 'package:task1intern/features/payment/ui/payment_screen.dart';
import 'package:task1intern/features/payment/ui/success_order_screen.dart';
import 'package:task1intern/features/payment/ui/track_order_screen.dart';
import 'package:task1intern/features/profile/ui/profile_screen.dart';
import 'package:task1intern/features/splash/ui/splash_screen.dart';

class AppRouter {
  Route? genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreen());
      case Routes.authScreen:
        return MaterialPageRoute(builder: (context) => const MainAuthScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.forgetPassScreen:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordScreen());
      case Routes.passChangedScreen:
        return MaterialPageRoute(
            builder: (context) => const PasswordChangedScreen());
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      // case Routes.homeScreen:
      //   return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case Routes.allCategoriesScreen:
        return MaterialPageRoute(
            builder: (context) => const AllCategoriesScreen());
      case Routes.oneCategoryScreen:
        return MaterialPageRoute(
            builder: (context) => const OneCategoryScreen());
      case Routes.shopingCartScreen:
        return MaterialPageRoute(
            builder: (context) => const ShoppingCartScreen());
      case Routes.paymentScrren:
        return MaterialPageRoute(builder: (context) => const PaymentScreen());
      case Routes.otpScreen:
        return MaterialPageRoute(builder: (context) => const OtpScreen());
      case Routes.checkPhoneScreen:
        return MaterialPageRoute(
            builder: (context) => const CheckPhoneScreen());
      case Routes.orderAddressScreen:
        return MaterialPageRoute(
            builder: (context) => const OrderAddressScreen());
      case Routes.successOrderScreen:
        return MaterialPageRoute(
            builder: (context) => const SuccessOrderScreen());
      case Routes.trackOrderScreen:
        return MaterialPageRoute(
            builder: (context) => const TrackOrderScreen());
      case Routes.notificationsScreen:
        final message = settings.arguments as RemoteMessage;
        return MaterialPageRoute(
            builder: (context) => NotifictionsScreen(
                  messages: message,
                ));
      default:
        return null;
    }
  }
}
