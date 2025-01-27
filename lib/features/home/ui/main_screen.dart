import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/di/di.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/features/cart/logic/cubit/cart_cubit.dart';
import 'package:task1intern/features/cart/ui/shoping_cart_screen.dart';
import 'package:task1intern/features/favorites/favoriter_products_screen.dart';
import 'package:task1intern/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:task1intern/features/home/logic/cubit/products_cubit.dart';
import 'package:task1intern/features/home/ui/widgets/home_body.dart';
import 'package:task1intern/features/profile/ui/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        context.read<ProductsCubit>().getAllProducts(3);
      }
    });
  }

  final List<Widget> bodies = [
    const HomeBody(),
    BlocProvider(
      create: (context) => getIt<FavoritesCubit>()..getFavoriteProducts(),
      child: FavoriterProductsScreenBody(),
    ),
    BlocProvider(
      create: (context) => getIt<CartCubit>()..getAllCartProducts(),
      child: const ShoppingCartScreenBody(),
    ),
    const ProfileScreenBody()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: bodies[selectedIndex],
        bottomNavigationBar: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              selectedItemColor: AppColors.greenColor,
              landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: '',
                    activeIcon: Icon(Icons.home_sharp)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    label: '',
                    activeIcon: Icon(Icons.favorite)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_basket_outlined),
                    label: '',
                    activeIcon: Icon(Icons.shopping_basket_outlined)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_rounded),
                    label: '',
                    activeIcon: Icon(Icons.person)),
              ],
            ),
            Positioned(
              top: -15,
              child: Container(
                  padding: EdgeInsetsDirectional.all(8.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green.withValues(alpha: .8),
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 30,
                    fit: BoxFit.contain,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
