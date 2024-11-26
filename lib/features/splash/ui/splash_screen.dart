import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:task1intern/core/helper/constants.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/features/onboarding/ui/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double width = MediaQuery.sizeOf(context).width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            AppImages.backGroundImage,
            width: orientation == Orientation.portrait ? width / 3 : width / 5,
            fit: BoxFit.cover,
          ),
        ),
        buildSplashBody(context, orientation, width),
      ]),
    ));
  }

  Widget buildSplashBody(context, orientation, width) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          const Spacer(),
          Image.asset(
            AppImages.verticalLogoImage,
            width: orientation == Orientation.portrait ? width / 2 : width / 4,
          ),
          verticalSpace(orientation == Orientation.portrait ? 60 : 12),
          Image.asset("assets/images/loading.gif",
              width:
                  orientation == Orientation.portrait ? width / 5 : width / 12),
          const Spacer(),
        ],
      ),
      splashIconSize: MediaQuery.sizeOf(context).width,
      duration: 600,
      backgroundColor: Colors.transparent,
      animationDuration: const Duration(milliseconds: 1500),
      nextScreen: const OnboardingScreen(),
      nextRoute: Routes.onBoardingScreen,
    );
  }
}
