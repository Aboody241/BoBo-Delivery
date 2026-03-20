import 'package:bobo/core/consts/widgets/custom_forms.dart';
import 'package:bobo/features/home/pages/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Gap(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: CustomSearchBar(),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 5),
              itemCount: 50,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  width: double.maxFinite,
                  height: 100,
                  child: Stack(
                    children: [Image.asset('assets/discover/indian.png')],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


  //  CustomScrollView(
  //       slivers: [
  //         SliverToBoxAdapter(child: Gap(50)),
  //         SliverPersistentHeader(
  //           floating: true,
  //           delegate: SearchBarDelegate(searchController),
  //         ),
  //       ],
  //     ),
  //   );