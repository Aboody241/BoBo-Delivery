// import 'package:bobo/features/home/models/products_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// Future<List<Product>> getFood() async {
//   final snapshot = await FirebaseFirestore.instance.collection('products').get();
//   return snapshot.docs.map((doc) {
//     final data = doc.data();
//     // Assuming the document data contains the same fields expected by Product.fromMap
//     return Product.fromMap(data);
//   }).toList();
// }