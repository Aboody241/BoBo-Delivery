import 'package:bobo/features/home/models/products_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository {
  final FirebaseFirestore _firestore;

  ProductRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<Product>> getProducts() async {
    try {
      final snapshot = await _firestore.collection('products').get();
      return snapshot.docs.map((doc) {
        final data = doc.data();
        // Fallback id if 'document id' or 'id' doesn't exist in the JSON map
        if (!data.containsKey('id') && !data.containsKey('document id')) {
           data['id'] = doc.id;
        }
        return Product.fromJson(data);
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
}
