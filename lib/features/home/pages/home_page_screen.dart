import 'dart:ui';

import 'package:bobo/core/consts/theme/colors.dart';
import 'package:bobo/core/consts/widgets/custom_forms.dart';
import 'package:bobo/features/home/widgets/home_appbar.dart';
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
    'Fries'
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: HomeAppbar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10),
              CustomSearchBar(controller: searchController),
              Gap(15),

              // Horizontal categories list
              SizedBox(
                height: 50, // fixed height for cards
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryNames.length,
                  itemBuilder: (context, index) {
                    return CategoriesCard(
                      index: index,
                      categoryName: categoryNames[index],
                    );
                  },
                ),
              ),

              Gap(15),
            ],
          ),
        ),
      ),
    );
  }
}

// Horizontal Category Card
class CategoriesCard extends StatelessWidget {
  final int index;
  final String categoryName;
  const CategoriesCard({
    super.key,
    required this.index,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // fixed width for horizontal scroll
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: const Color(0xffECF1E8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          categoryName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// Vertical Item Card
