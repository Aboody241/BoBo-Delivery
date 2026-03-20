import 'package:bobo/core/consts/routes/routes.dart';
import 'package:bobo/core/consts/theme/colors.dart';
import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:bobo/features/home/models/products_model.dart';
import 'package:bobo/services/products/products_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeProductsList extends StatefulWidget {
  const HomeProductsList({super.key});

  @override
  State<HomeProductsList> createState() => HomeProductsListState();
}

class HomeProductsListState extends State<HomeProductsList> {
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = getProducts();
  }

  Future<void> refreshProducts() async {
    // هنا بنعيد تحميل البيانات
    setState(() {
      _productsFuture = getProducts();
    });
    await _productsFuture;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(child: Text('No products found')),
          );
        }

        final foods = snapshot.data!;

        return SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            final food = foods[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(AppRoutes.productDetailScreen, arguments: food);
              },
              child: Card(
                shadowColor: AppColors.lightGrey0,
                color: AppColors.lightGrey0,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      child: Image.network(
                        food.image,
                        width: 170,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food.name,
                            style: AppTextStyle.poppins16.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Gap(7),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${food.price}",
                                style: AppTextStyle.poppins20Bold,
                              ),
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 233, 240, 228),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 28,
                                  color: AppColors.darkGradientDark,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }, childCount: foods.length),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 10,
            childAspectRatio: 0.72,
          ),
        );
      },
    );
  }
}
