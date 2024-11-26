import 'package:flutter/material.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/features/home/ui/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: HomeBody(),
    ));
  }
}
