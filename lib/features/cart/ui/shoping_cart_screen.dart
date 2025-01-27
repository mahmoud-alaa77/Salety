import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/hive_helper.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/text_and_colored_buton.dart';
import 'package:task1intern/features/cart/logic/cubit/cart_cubit.dart';
import 'package:toast/toast.dart';

class ShoppingCartScreenBody extends StatefulWidget {
  const ShoppingCartScreenBody({super.key});

  @override
  State<ShoppingCartScreenBody> createState() => _ShoppingCartScreenBodyState();
}

class _ShoppingCartScreenBodyState extends State<ShoppingCartScreenBody> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return buildPortraitLayout(
            isTablet, isPortrait, screenWidth, screenHeight, context);
      } else {
        return buildLandScapeLayout(
            isTablet, isPortrait, screenWidth, screenHeight, context);
      }
    });
  }

  BlocBuilder buildPortraitLayout(bool isTablet, bool isPortrait,
      double screenWidth, double screenHeight, BuildContext context) {
    ToastContext().init(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        int totalQuantity = 0;
        double totalPrice = 0;
        if (state is CartLoaded) {
          for (int i = 0; i < state.cartProducts.length; i++) {
            totalQuantity = totalQuantity + state.cartProducts[i].quantity;
            totalPrice = totalPrice +
                state.cartProducts[i].price * state.cartProducts[i].quantity;
          }
          if (state.cartProducts.isEmpty) {
            return Center(
                child: Text(
              'No items in cart',
              style: AppTextStyles.font20BlackW400,
            ));
          } else {
            return Column(
              children: [
                Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: isTablet ? 16.r : 8.r, vertical: 20.r),
                    child: Text("عربة التسوق",
                        style: isTablet
                            ? AppTextStyles.font26BlackBold
                            : AppTextStyles.font18BlackW300)),
                verticalSpace(isTablet ? 24 : 4),
                Expanded(
                    child: ListView.builder(
                  itemCount: state.cartProducts.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (DismissDirection direction) {
                        context
                            .read<CartCubit>()
                            .removeProductFromCart(state.cartProducts[index]);
                      },
                      background: Container(
                        margin: const EdgeInsetsDirectional.symmetric(
                            horizontal: 8, vertical: 8),
                        color: AppColors.backGroundColor,
                        child: Center(
                          child: Icon(
                            Icons.close,
                            size: 65.r,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: isTablet ? 125.r : 20.r,
                            vertical: 10.r),
                        padding: EdgeInsetsDirectional.symmetric(
                            vertical: 4.r, horizontal: 12.r),
                        width: screenWidth,
                        height: screenHeight / 6.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {});
                                      if (state.cartProducts[index].quantity >
                                          1) {
                                        state.cartProducts[index].quantity--;
                                      } else {
                                        Toast.show("لا يمكن تقليل الكمية ",
                                            duration: Toast.lengthShort,
                                            gravity: Toast.bottom);
                                      }
                                      HiveHelper()
                                          .checkAndUpdateOrAddProductToCart(
                                              state.cartProducts[index]);
                                    },
                                    icon: Icon(
                                      Icons.minimize,
                                      size: isTablet ? 45.w : 28.w,
                                    ),
                                  ),
                                  Text(
                                    state.cartProducts[index].quantity
                                        .toString(),
                                    style: isTablet
                                        ? AppTextStyles.font24BlackBold
                                        : AppTextStyles.font18BlackW300,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {});
                                      if (state.cartProducts[index].quantity <
                                          24) {
                                        state.cartProducts[index].quantity++;
                                      } else {
                                        Toast.show(
                                            "لا يوجد كمية كافية في المخزن",
                                            duration: Toast.lengthShort,
                                            gravity: Toast.bottom);
                                      }
                                      HiveHelper()
                                          .checkAndUpdateOrAddProductToCart(
                                              state.cartProducts[index]);
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      size: isTablet ? 45.w : 28.w,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${state.cartProducts[index].quantity} * ${state.cartProducts[index].price} EGP",
                                    style: TextStyle(
                                        color: AppColors.greenColor,
                                        fontSize: isTablet ? 30.sp : 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  verticalSpace(isTablet ? 10 : 4),
                                  Text(
                                    state.cartProducts[index].name,
                                    style: isTablet
                                        ? AppTextStyles.font26BlackBold
                                        : AppTextStyles.font18BlackW300,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: CachedNetworkImage(
                                    imageUrl:
                                        "https://master-market.masool.net/uploads/${state.cartProducts[index].imageUrl}"))
                          ],
                        ),
                      ),
                    );
                  },
                )),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: isTablet ? 125.r : 20.r, vertical: 10.r),
                  padding: EdgeInsetsDirectional.all(isTablet ? 26.r : 16.r),
                  width: screenWidth,
                  height: isTablet ? screenHeight / 6 : screenHeight / 5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      buildTextRow(
                          "البنود",
                          totalQuantity.toString(),
                          isTablet
                              ? AppTextStyles.font16greyw200
                              : AppTextStyles.font12greyw200),
                      verticalSpace(4),
                      buildTextRow(
                          "المجموع الفرعي",
                          "${totalPrice.toString()} EGP",
                          isTablet
                              ? AppTextStyles.font16greyw200
                              : AppTextStyles.font12greyw200),
                      verticalSpace(4),
                      buildTextRow(
                          "رسوم التوصيل",
                          "Free",
                          isTablet
                              ? AppTextStyles.font16greyw200
                              : AppTextStyles.font12greyw200),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("الاجمالي",
                              style: isTablet
                                  ? AppTextStyles.font24BlackBold
                                  : AppTextStyles.font14BlackW300),
                          Text("${totalPrice.toString()} EGP",
                              style: isTablet
                                  ? AppTextStyles.font24BlackBold
                                  : AppTextStyles.font12BlackW300
                                      .copyWith(fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                ),
                verticalSpace(isTablet ? 16 : 8),
                Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: isTablet ? 125.r : 20.r),
                    child: TextAndColoredButton(
                        onTap: () {
                          context.pushNamed(Routes.paymentScrren);
                        },
                        height:
                            isTablet ? screenHeight / 20 : screenHeight / 15,
                        title: "الدفع",
                        width: screenWidth,
                        fontSize: isTablet ? 28.sp : 20.sp,
                        color: AppColors.greenColor)),
                verticalSpace(isTablet ? 32 : 24),
              ],
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  BlocBuilder buildLandScapeLayout(bool isTablet, bool isPortrait,
      double screenWidth, double screenHeight, BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: isTablet ? 120.r : 24.r, vertical: 16.r),
            child: Column(
              children: [
                Text("عربة التسوق",
                    style: isTablet
                        ? AppTextStyles.font26BlackBold
                        : AppTextStyles.font12BlackW300),
                verticalSpace(isTablet ? 24 : 16),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenWidth / 1.8,
                        child: ListView.builder(
                          itemCount: state.cartProducts.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: UniqueKey(),
                              onDismissed: (DismissDirection direction) {
                                HiveHelper().removeProductFromCart(
                                    state.cartProducts[index]);
                              },
                              background: Container(
                                margin: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 8, vertical: 8),
                                color: AppColors.backGroundColor,
                                child: Center(
                                  child: Icon(
                                    Icons.close,
                                    size: 65.r,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: isTablet ? 26.r : 4.r,
                                    vertical: 10.r),
                                padding: EdgeInsetsDirectional.symmetric(
                                    vertical: 4.r, horizontal: 12.r),
                                height: screenHeight / 3.2,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(
                                          isTablet ? 24.r : 16.r),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.minimize,
                                            size: isTablet ? 30.w : 10.w,
                                          ),
                                          Text(
                                            "2",
                                            style: isTablet
                                                ? AppTextStyles.font18BlackW300
                                                : AppTextStyles.font10BlackW300,
                                          ),
                                          Icon(
                                            Icons.add,
                                            size: isTablet ? 30.w : 15.w,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${state.cartProducts[index].quantity} * ${state.cartProducts[index].price} EGP",
                                            style: TextStyle(
                                                color: AppColors.greenColor,
                                                fontSize:
                                                    isTablet ? 20.sp : 10.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            state.cartProducts[index].name,
                                            style: isTablet
                                                ? AppTextStyles.font18BlackW300
                                                : AppTextStyles.font10BlackW300,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: CachedNetworkImage(
                                            imageUrl:
                                                "https://master-market.masool.net/uploads/${state.cartProducts[index].imageUrl}"))
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: isTablet ? 26.r : 8.r,
                                  vertical: 10.r),
                              padding: EdgeInsetsDirectional.all(
                                  isTablet ? 26.r : 16.r),
                              width: screenWidth,
                              height: screenHeight / 2.8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12.r),
                              ),
                              child: Column(
                                children: [
                                  buildTextRow(
                                      "البنود",
                                      state.cartProducts.length.toString(),
                                      isTablet
                                          ? AppTextStyles.font16greyw200
                                          : AppTextStyles.font8greyw200),
                                  verticalSpace(4),
                                  buildTextRow(
                                      "المجموع الفرعي",
                                      "${context.read<CartCubit>().totalPrice.toString()} EGP",
                                      isTablet
                                          ? AppTextStyles.font16greyw200
                                          : AppTextStyles.font8greyw200),
                                  verticalSpace(4),
                                  buildTextRow(
                                      "رسوم التوصيل",
                                      "Free",
                                      isTablet
                                          ? AppTextStyles.font16greyw200
                                          : AppTextStyles.font8greyw200),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("الاجمالي",
                                          style: isTablet
                                              ? AppTextStyles.font12BlackW300
                                              : AppTextStyles.font8BlackW300),
                                      Text(
                                          "${context.read<CartCubit>().totalPrice.toString()} EGP",
                                          style: isTablet
                                              ? AppTextStyles.font12BlackW300
                                              : AppTextStyles.font8BlackW300
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            verticalSpace(isTablet ? 16 : 0),
                            Padding(
                                padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: isTablet ? 26.r : 8.r),
                                child: TextAndColoredButton(
                                    onTap: () {
                                      context.pushNamed(Routes.paymentScrren);
                                    },
                                    height: isTablet
                                        ? screenHeight / 14
                                        : screenHeight / 8,
                                    title: "الدفع",
                                    width: screenWidth,
                                    fontSize: isTablet ? 18.sp : 12.sp,
                                    color: AppColors.greenColor)),
                            verticalSpace(isTablet ? 16 : 0)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Row buildTextRow(String value, String key, TextStyle style) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(value, style: style),
        Text(key, style: style),
      ],
    );
  }
}
