import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/custom_shimmer_loading_container.dart';
import 'package:task1intern/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:task1intern/features/home/logic/cubit/products_cubit.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        title: const Text('كل المنتجات'),
        elevation: 0,
        backgroundColor: AppColors.backGroundColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoaded) {
                  return _buildProductList(context, state, isPortrait);
                } else {
                  return _buildLoadingList(isPortrait);
                }
              },
            ),
          ),
          verticalSpace(12),
          _buildPaginationControls(),
          verticalSpace(16),
        ],
      ),
    );
  }

  Widget _buildProductList(BuildContext context, ProductsLoaded state, bool isPortrait) {
    return ListView.builder(
      itemCount: state.products.data!.data!.length,
      itemBuilder: (context, index) {
        final product = state.products.data!.data![index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: isPortrait ? 16.r : 120.r,
            vertical: 12.r,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 8.r,
            vertical: 12.r,
          ),
          child: Row(
            children: [
              _buildProductImage(product.img.toString(), isPortrait),
              horizontalSpace(6),
              _buildProductDetails(product),
              _buildFavoriteIcon(context, product, isPortrait),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoadingList(bool isPortrait) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16.r,
            horizontal: isPortrait ? 0 : 120.r,
          ),
          child: CustomShimmerLoadingContainer(
            height: 140.h,
            width: double.infinity,
          ),
        );
      },
    );
  }

  Widget _buildProductImage(String imgUrl, bool isPortrait) {
    return Expanded(
      flex: 2,
      child: CachedNetworkImage(
        imageUrl: "https://master-market.masool.net/uploads/$imgUrl",
        width: isPortrait ? 100.w : 50.w,
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
    );
  }

  Widget _buildProductDetails(product) {
    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name.toString(),
            style: AppTextStyles.font14BlackW300,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(4),
          Text(
            product.details.toString(),
            style: AppTextStyles.font12greyw200,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(4),
          Text(
            "${product.price} EGP",
            style: AppTextStyles.font12BlackW300.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteIcon(BuildContext context, product, bool isPortrait) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          setState(() {
            product.isFavorite = product.isFavorite == 0 ? 1 : 0;
          });
          context.read<FavoritesCubit>().addOrDeleteProduct(product.id!);
        },
        child: Icon(
          Icons.favorite,
          color: product.isFavorite != 0 ? AppColors.greenColor : Colors.grey,
          size: isPortrait ? 30.w : 15.w,
        ),
      ),
    );
  }

  Widget _buildPaginationControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (currentPage > 1)
          GestureDetector(
            onTap: _previousPage,
            child: Row(
              children: const [
                Icon(Icons.arrow_back_ios),
                Text("السابق"),
              ],
            ),
          ),
        horizontalSpace(16),
        Text(
          "$currentPage",
          style: AppTextStyles.font24RedBold,
        ),
        horizontalSpace(16),
        if (currentPage < 6)
          GestureDetector(
            onTap: _nextPage,
            child: Row(
              children: const [
                Text("التالي"),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
      ],
    );
  }

  void _previousPage() {
    setState(() {
      if (currentPage > 1) {
        currentPage--;
        context.read<ProductsCubit>().getAllProducts(currentPage);
      }
    });
  }

  void _nextPage() {
    setState(() {
      if (currentPage < 6) {
        currentPage++;
        context.read<ProductsCubit>().getAllProducts(currentPage);
      }
    });
  }
}
