import 'package:flutter/material.dart';
import 'package:task1intern/core/helper/constants.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/features/onboarding/ui/widgets/custom_indicator.dart';
import 'package:task1intern/features/onboarding/ui/widgets/on_boarding_screen_body.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int index = 0;
  PageController? controller = PageController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(children: [
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  AppImages.backGroundImage,
                  width: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? MediaQuery.sizeOf(context).width / 4
                      : MediaQuery.sizeOf(context).width / 2,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: controller,
                      onPageChanged: (value) {
                        setState(() {});
                        index = value;
                      },
                      children: const [
                        OnBoardingScreenBody(
                            color: AppColors.redColor,
                            image: "assets/images/shop.png",
                            title: "البحث بالقرب منك",
                            subTitle:
                                "ابحث عن المتاجر المفضلة التي تريدها بموقعك او حيك"),
                        OnBoardingScreenBody(
                            color: AppColors.greenColor,
                            image: "assets/images/shop.png",
                            title: "عروض طازجة وجودة",
                            subTitle:
                                "جميع العناصر لها نضارة حقيقية وهي مخصص لاحتيجاتك"),
                        OnBoardingScreenBody(
                            color: AppColors.greyColor,
                            image: "assets/images/delivery.png",
                            title: "تسليم سريع للمنزل",
                            subTitle:
                                "جميع العناصر لها نضارة حقيقية وهي مخصص لاحتيجاتك"),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIndicator(
                            active: index == 0, color: AppColors.redColor),
                        horizontalSpace(5),
                        CustomIndicator(
                            active: index == 1, color: AppColors.greenColor),
                        horizontalSpace(5),
                        CustomIndicator(
                            active: index == 2, color: AppColors.greyColor),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {});
                            index != 2
                                ? controller?.animateToPage(index + 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.linear)
                                : context.pushNamed(Routes.authScreen);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(100),
                                color: index == 0
                                    ? AppColors.redColor
                                    : index == 1
                                        ? AppColors.greenColor
                                        : AppColors.greyColor,
                                shape: BoxShape.circle),
                            width: screenWidth / 8,
                            height: screenHeight / 8,
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: screenWidth / 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? verticalSpace(24)
                      : verticalSpace(8),
                ],
              ),
            ])));
  }
}
