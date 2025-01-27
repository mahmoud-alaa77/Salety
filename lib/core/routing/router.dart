import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/core/di/di.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/features/auth/forget_password/ui/check_phone_screen.dart';
import 'package:task1intern/features/auth/forget_password/ui/forget_password_screen.dart';
import 'package:task1intern/features/auth/forget_password/ui/otp_screen.dart';
import 'package:task1intern/features/auth/forget_password/ui/password_changed_screen.dart';
import 'package:task1intern/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:task1intern/features/auth/main_auth_screen.dart';
import 'package:task1intern/features/auth/login/ui/login_screen.dart';
import 'package:task1intern/features/auth/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:task1intern/features/cart/logic/cubit/cart_cubit.dart';
import 'package:task1intern/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:task1intern/features/home/data/models/category_model.dart';
import 'package:task1intern/features/home/data/models/product_model.dart';
import 'package:task1intern/features/home/logic/cubit/categories_cubit.dart';
import 'package:task1intern/features/home/logic/cubit/products_cubit.dart';
import 'package:task1intern/features/home/logic/cubit/slider_product_cubit.dart';
import 'package:task1intern/features/home/ui/main_screen.dart';
import 'package:task1intern/features/home/ui/screens/all_categories_screen.dart';
import 'package:task1intern/features/home/ui/screens/all_products_screen.dart';
import 'package:task1intern/features/home/ui/screens/product_details_screen.dart';
import 'package:task1intern/features/cart/ui/shoping_cart_screen.dart';
import 'package:task1intern/features/home/ui/screens/one_category_screen.dart';
import 'package:task1intern/features/notifications/ui/notifictions_screen.dart';
import 'package:task1intern/features/onboarding/ui/onboarding_screen.dart';
import 'package:task1intern/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:task1intern/features/payment/ui/order_address_screen.dart';
import 'package:task1intern/features/payment/ui/payment_screen.dart';
import 'package:task1intern/features/payment/ui/success_order_screen.dart';
import 'package:task1intern/features/payment/ui/track_order_screen.dart';
import 'package:task1intern/features/profile/logic/cubit/profile_cubit.dart';
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
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<SignUpCubit>(),
                  child: const SignUpScreen(),
                ));
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.forgetPassScreen:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordScreen());
      case Routes.passChangedScreen:
        return MaterialPageRoute(
            builder: (context) => const PasswordChangedScreen());
      case Routes.mainScreen:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          getIt<SliderProductCubit>()..getSliderProducts(),
                    ),
                    BlocProvider(
                      create: (context) =>
                          getIt<CategoriesCubit>()..getCategories(),
                    ),
                    BlocProvider(
                      create: (context) =>
                          getIt<ProductsCubit>()..getAllProducts(3),
                    ),
                    BlocProvider(
                      create: (context) => getIt<FavoritesCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<CartCubit>(),
                    ),
                    BlocProvider(
                      create: (context) =>
                          getIt<ProfileCubit>()..getProfileData(),
                    ),
                  ],
                  child: const MainScreen(),
                ));
      // case Routes.homeScreen:
      //   return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<ProfileCubit>()..getProfileData(),
                  child: const ProfileScreen(),
                ));
      case Routes.allCategoriesScreen:
        return MaterialPageRoute(
            builder: (context) => const AllCategoriesScreen());
      case Routes.oneCategoryScreen:
        final data = settings.arguments as Data;
        return MaterialPageRoute(
            builder: (context) => OneCategoryScreen(
                  categoryModel: data,
                ));

      case Routes.oneProductScreen:
        final product = settings.arguments as ProductData;
        return MaterialPageRoute(
            builder: (context) => ProductDetails(
                  product: product,
                ));
      case Routes.shopingCartScreen:
        return MaterialPageRoute(
            builder: (context) => const ShoppingCartScreenBody());
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

      case Routes.allProductsScreen:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          getIt<ProductsCubit>()..getAllProducts(0),
                    ),
                    BlocProvider(
                      create: (context) => getIt<FavoritesCubit>(),
                    ),
                  ],
                  child: const AllProductsScreen(),
                ));
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
