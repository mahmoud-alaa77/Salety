import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/hive_helper.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/text_and_colored_buton.dart';
import 'package:task1intern/features/cart/data/models/hive_product_cart.dart';
import 'package:task1intern/features/home/data/models/product_model.dart';
import 'package:toast/toast.dart';

class ProductDetails extends StatefulWidget {
  final ProductData product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantities = 1;
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.name.toString(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.font18BlackW300,
        ),
        backgroundColor: AppColors.backGroundColor,
      ),
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl:
                    "https://master-market.masool.net/uploads/${widget.product.img.toString()}",
                fit: BoxFit.fill,
                width: double.infinity,
                height: 350.h,
                errorWidget: (context, url, error) => SizedBox(
                  width: 50,
                  height: 70.h,
                  child: const Center(
                    child: Icon(
                      Icons.error,
                      color: AppColors.redColor,
                    ),
                  ),
                ),
              ),
              verticalSpace(16),
              Text(
                widget.product.name.toString(),
                style: AppTextStyles.font22BlackBold,
              ),
              verticalSpace(16),
              Text(
                widget.product.details ?? "التفاصيل",
                style: AppTextStyles.font18greyw200,
                textAlign: TextAlign.justify,
              ),
              verticalSpace(16),
              Text(
                "السعر: ${widget.product.price.toString()} EGP",
                style: AppTextStyles.font18BlackW300,
              ),
              verticalSpace(50),
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(8),
                          color: Colors.grey.withValues(alpha: .5)),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            iconSize: 22.w,
                            onPressed: () {
                              setState(() {});
                              if (quantities > 1) {
                                quantities--;
                              } else {
                                Toast.show("لا يمكن تقليل الكمية ",
                                    duration: Toast.lengthShort,
                                    gravity: Toast.bottom);
                              }
                            },
                          ),
                          Text(
                            quantities.toString(),
                            style: AppTextStyles.font12BlackW300,
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            iconSize: 22.w,
                            onPressed: () {
                              setState(() {});
                              if (quantities <24) {
                                quantities++;
                              } else {
                                Toast.show("لا يوجد كمية كافية في المخزن",
                                    duration: Toast.lengthShort,
                                    gravity: Toast.bottom);
                              }
                            },
                          )
                        ],
                      )),
                  horizontalSpace(8),
                  Expanded(
                    child: TextAndColoredButton(
                      height: 60.h,
                      title: "اضافة الى السلة",
                      width: 100.w,
                      color: Colors.black,
                      onTap: () {
                        HiveProductCart cartProduct = HiveProductCart(
                          id: widget.product.id!.toInt(),
                          name: widget.product.name.toString(),
                          description: widget.product.details.toString(),
                          price: double.parse(widget.product.price.toString()),
                          imageUrl: widget.product.img.toString(),
                          quantity: quantities,
                        );
                        HiveHelper()
                            .checkAndUpdateOrAddProductToCart(cartProduct);
                        Toast.show("تم اضافة المنتج بنجاح",
                            duration: Toast.lengthShort, gravity: Toast.bottom);
                      },
                    ),
                  )
                ],
              ),
              verticalSpace(24),
            ],
          ),
        ),
      ),
    );
  }
}
