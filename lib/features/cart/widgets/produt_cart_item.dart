import 'package:flutter/material.dart';

class ProdutCartItem extends StatelessWidget {
  const ProdutCartItem({
    super.key,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  final String productName;
  final double price;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      width: double.infinity,
      height: 110,
      padding: const EdgeInsets.all(4),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shadows: [
          BoxShadow(
            color: const Color.fromARGB(255, 199, 199, 199),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: const Color(0xFFF4F7F2)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/products/pizzaa.png'),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: const Color(0x0F91958E)),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(4),
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Container(
              height: double.infinity,
              padding: const EdgeInsets.only(top: 8, right: 8, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),

                      SizedBox(
                        width: 211,
                        child: Text(
                          productName,
                          style: TextStyle(
                            color: Color(0xFF60655C),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1.30,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 109,
                        child: Text(
                          "\$$price",
                          style: TextStyle(
                            color: Color(0xFF363A33),
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            height: 1.30,
                          ),
                        ),
                      ),

                      // const SizedBox(width: 12),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: onRemove,
                            child: Container(
                              width: 32,
                              height: 32,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFF4F7F2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: const Icon(Icons.remove),
                            ),
                          ),

                          const SizedBox(width: 8),

                          AnimatedDefaultTextStyle(
                            style: const TextStyle(
                              color: Color(0xFF60655C),
                              fontSize: 18,
                              fontFamily: 'Roboto Mono',
                              fontWeight: FontWeight.w700,
                              height: 1.30,
                              letterSpacing: -0.15,
                            ),
                            duration: Duration(seconds: 4),
                            curve: Curves.bounceIn,
                            child: Text('$quantity'),
                          ),

                          const SizedBox(width: 8),

                          GestureDetector(
                            onTap: onAdd,
                            child: Container(
                              width: 32,
                              height: 32,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFF4F7F2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProducDetails {
  final String name;
  final double price;
  int count;

  ProducDetails({required this.name, required this.price, this.count = 1});
}
