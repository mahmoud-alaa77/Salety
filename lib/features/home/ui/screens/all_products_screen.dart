import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/custom_shimmer_loading_container.dart';
import 'package:task1intern/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:task1intern/features/home/data/models/product_model.dart';
import 'package:task1intern/features/home/logic/cubit/products_cubit.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  int currentPage = 1;
  final ScrollController scrollController = ScrollController();
  List<ProductData> products = [];
  bool isLoadingMore = false;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !isLoadingMore &&
          hasMore) {
        fetchMoreProducts();
      }
    });
    BlocProvider.of<ProductsCubit>(context).getAllProducts(currentPage);
  }

  void fetchMoreProducts() async {
    setState(() {
      isLoadingMore = true;
    });

    currentPage++;
    final productsCubit = BlocProvider.of<ProductsCubit>(context);

    await productsCubit.getAllProducts(currentPage).then((_) {
      if (productsCubit.state is ProductsLoaded) {
        final newProducts =
            (productsCubit.state as ProductsLoaded).products.data!.data!;
        if (newProducts.isEmpty) {
          hasMore = false;
        } else {
          products.addAll(newProducts);
        }
      }
      setState(() {
        isLoadingMore = false;
      });
    }).catchError((_) {
      setState(() {
        isLoadingMore = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        title: const Text('كل المنتجات'),
        elevation: 0,
        backgroundColor: AppColors.backGroundColor,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () async{
        //                 context.pop();

        //     context.read<ProductsCubit>().getAllProducts(3);
        //   },
        // ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoaded) {
                  if (currentPage == 1) {
                    products = state.products.data!.data!;
                  }
                  return _buildProductList(context, isPortrait);
                } else if (state is ProductsLoading && products.isEmpty) {
                  return _buildLoadingList(isPortrait);
                } else {
                  return _buildProductList(context, isPortrait);
                }
              },
            ),
          ),
          if (isLoadingMore)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.r),
              child: const CircularProgressIndicator(
                color: AppColors.greenColor,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildProductList(BuildContext context, bool isPortrait) {
    return ListView.builder(
      controller: scrollController,
      physics: BouncingScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        if (index == products.length - 1) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.r),
            child: Center(
              child: Text(
                "لقد وصلت لنهاية القائمة",
                style: AppTextStyles.font14greyw200,
              ),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              context.pushNamed(Routes.oneProductScreen, arguments: product);
            },
            child: Container(
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
            ),
          );
        }
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
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
}
