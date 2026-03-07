import 'package:bobo/core/consts/theme/colors.dart';
import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:bobo/core/consts/widgets/custom_buttons.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  bool isFavorate = false;

  double currentIndex = 0;
  int productNum = 0;
  bool isExpanded = false;
  int productPrice = 0;

  final PageController pageController = PageController();

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      upperBound: 40,
      lowerBound: 20,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Details', style: AppTextStyle.poppins24Bold),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share, color: AppColors.darkGrey100),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isFavorate = !isFavorate;
              });
            },
            child: Icon(
              isFavorate ? Icons.favorite_border_rounded : Icons.favorite,
              size: 30,
              color: isFavorate ? Colors.black : Colors.red,
            ),
          ),
          Gap(10),
        ],
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: 340,
              height: 380,
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index.toDouble();
                        });
                      },
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/products/productDetails.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(20),
                            child: Image.asset(
                              'assets/products/productDetails.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(20),
                            child: Image.asset(
                              'assets/products/productDetails.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  DotsIndicator(
                    decorator: DotsDecorator(
                      size: Size(16, 16),
                      activeSize: Size(18, 18),
                      color: const Color.fromARGB(255, 225, 225, 225),
                    ),
                    dotsCount: 3,
                    position: currentIndex,
                    animate: true,
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Gap(20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.borderColor,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star_rate_rounded,
                              color: Color(0xffF5AE42),
                              size: 30,
                            ),
                            Text('4.8', style: AppTextStyle.poppins16),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/products/ckals.svg',
                              width: 20,
                              height: 20,
                            ),
                            Gap(4),
                            Text('300kcal', style: AppTextStyle.poppins16),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later_sharp,
                              size: 20,
                              color: AppColors.darkBlue,
                            ),
                            Gap(4),
                            Text('20mins', style: AppTextStyle.poppins16),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pepperoni Cheese \nPizza',
                        style: AppTextStyle.poppins20Bold,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: AppColors.borderColor,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (productNum > 0) {
                                  setState(() {
                                    productNum--;
                                    productPrice -= 12;
                                  });
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.lightGrey200,
                                ),
                                child: Icon(Icons.remove, size: 26),
                              ),
                            ),
                            Gap(10),
                            AnimatedDefaultTextStyle(
                              style: AppTextStyle.poppins20Bold.copyWith(
                                color: Colors.black,
                              ),
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                              child: Text(productNum.toString()),
                            ),
                            Gap(10),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  productNum++;
                                  productPrice += 12;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.lightGrey200,
                                ),
                                child: Icon(Icons.add, size: 26),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Text(
                      'A classic favorite! Indulge in a crispy, thin crust topped with rich tomato sauce, layers of gooey mozzarella cheese, and delicious pepperoni slices. Perfectly baked with a hint of herbs for a mouth-watering experience in every bite.',
                      maxLines: isExpanded ? null : 2,
                      overflow: isExpanded
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                      style: AppTextStyle.poppins16.copyWith(
                        color: AppColors.darkGrey300,
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        isExpanded ? 'See less' : 'Read more',
                        style: AppTextStyle.poppins14Bold,
                      ),
                    ),
                  ),
                  Gap(50),
                  Row(
                    children: [
                      Text(
                        '\$$productPrice',
                        style: AppTextStyle.poppins24Bold,
                      ),
                      Gap(20),
                      Expanded(
                        child: CustomButton2(
                          onPressed: () {},
                          title: 'Add to card',
                          hei: 55,
                        ),
                      ),
                    ],
                  ),
                  Gap(30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
