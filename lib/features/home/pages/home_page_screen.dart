
import 'package:bobo/core/consts/theme/colors.dart';
import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:bobo/core/consts/widgets/custom_forms.dart';
import 'package:bobo/features/home/widgets/category_cards.dart';
import 'package:bobo/features/home/widgets/home_appbar.dart';
import 'package:bobo/features/home/widgets/home_slider_banner.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  TextEditingController searchController = TextEditingController();

  // Example categories
  final List<String> categoryNames = ['Offers', 'Burger', 'Pizza', 'Donut'];

  // Example items for vertical list
  final List<String> itemNames = [
    'Cheese Burger',
    'Margherita Pizza',
    'Chocolate Donut',
    'Vegan Salad',
    'Fries',
  ];

  int selectedCategoryIndex = 0; // افتراضياً أول عنصر مختار

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: HomeAppbar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                floating: true,
                delegate: _SearchBarDelegate(searchController),
              ),

              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const Gap(10),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryNames.length,
                        itemBuilder: (context, index) {
                          bool isSelected = index == selectedCategoryIndex;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategoryIndex = index;
                              });
                            },
                            child: CategoriesCard(
                              index: index,
                              categoryName: categoryNames[index],
                              isSelected: isSelected,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: HomeSliderBanner()),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(childCount: 5, (
                  context,
                  index,
                ) {
                  return Card(
                    shadowColor: AppColors.lightGrey0,
                    color: AppColors.lightGrey0,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8,
                              ),
                              child: Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15),
                                  ),
                                  child: Image.asset(
                                    'assets/products/burger_test.png',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 1,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_rounded,
                                      color: AppColors.lightYellow,
                                    ),
                                    Text(
                                      '4.7',
                                      style: AppTextStyle.poppins14.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Classic Burger',
                                style: AppTextStyle.poppins16.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                                const Gap(10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$12.50',
                                    style: AppTextStyle.poppins20Bold,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 233, 240, 228),
                                    ),
                                    child: Icon(
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
                  );
                }),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 250,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final TextEditingController controller;

  _SearchBarDelegate(this.controller);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: CustomSearchBar(controller: controller),
    );
  }

  @override
  double get maxExtent => 60;
  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
