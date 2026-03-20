import 'package:bobo/core/consts/routes/routes.dart';
import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:bobo/core/consts/widgets/custom_appbar.dart';
import 'package:bobo/core/consts/widgets/custom_buttons.dart';
import 'package:bobo/features/cart/widgets/produt_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<ProducDetails> products = [
    ProducDetails(name: 'Pepperoni Cheese Pizza', price: 12.0, count: 1),
    ProducDetails(name: 'Classic Burger', price: 21.55, count: 1),
    ProducDetails(name: 'Donut Box', price: 13.45, count: 1),
  ];

  double get totalPrice =>
      products.fold(0, (sum, item) => sum + (item.price * item.count));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CenterWidgetAppbar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/cart_icon.svg',
                width: 40,
                height: 40,
              ),
              Text('Cart', style: AppTextStyle.poppins22Bold),
            ],
          ),
        ),
      ),

      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(childCount: products.length, (
              context,
              index,
            ) {
              final product = products[index];

              return ProdutCartItem(
                productName: product.name,
                price: product.price,
                quantity: product.count,
                onAdd: () {
                  setState(() {
                    product.count++;
                  });
                },
                onRemove: () {
                  setState(() {
                    if (product.count > 1) {
                      product.count--;
                    }
                  });
                },
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
          left: 20,
          right: 20,
          top: 10,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                '${totalPrice.toStringAsFixed(2)}',
                style: AppTextStyle.poppins20Bold,
              ),
            ),
            Expanded(
              flex: 3,
              child: CustomButton2(
                onPressed: () {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pushNamed(AppRoutes.checkAddressScreen);
                },
                title: 'Proceed to  Pay',
                hei: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
