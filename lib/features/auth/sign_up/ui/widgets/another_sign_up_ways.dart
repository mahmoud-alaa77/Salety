import 'package:flutter/material.dart';
import 'package:task1intern/core/helper/helper_functions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/features/auth/sign_up/ui/widgets/social_media_button.dart';

class AnotherSignUpWays extends StatelessWidget {
  const AnotherSignUpWays({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        SocialMediaButton(
          label: "Facebook",
          imageUrl: "assets/images/facebook.png",
          borderColor: Colors.blue,
         width: screenWidth/3,
          height: screenHeight/6,
          style: TextStyle(
              color: const Color.fromARGB(255, 13, 124, 214),
              fontSize:HelperFunctions().getResponsiveFontSize(context, fontSize: 16)),
        ),
        horizontalSpace(HelperFunctions().getResponsiveWidth(context, width: 12)),
        SocialMediaButton(
          label: "Google",
          imageUrl: "assets/images/google.png",
          borderColor: Colors.red,
          width: screenWidth/3,
          height: screenHeight/6,
          style: TextStyle(color: Colors.red, fontSize:HelperFunctions().getResponsiveFontSize(context, fontSize: 16)),
        ),
      ],
    );
  }
}
