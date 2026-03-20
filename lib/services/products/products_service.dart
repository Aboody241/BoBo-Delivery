import 'package:bobo/features/home/models/products_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Product>> getProducts() async {
  final snapshot =
      await FirebaseFirestore.instance.collection('products').get();

  return snapshot.docs
      .map((doc) => Product.fromJson(doc.data()))
      .toList();
}
