import 'package:bobo/controller/order/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderRepository {
  final FirebaseFirestore _firestore;

  OrderRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> placeOrder(OrderModel order) async {
    try {
      await _firestore.collection('orders').add(order.toJson());
    } catch (e) {
      throw Exception('Failed to place order: $e');
    }
  }

  Future<List<OrderModel>> getUserOrders(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('orders')
          .where('userId', isEqualTo: userId)
          .orderBy('craateAt', descending: true) // Using the spelling from DB
          .get();

      return snapshot.docs.map((doc) => OrderModel.fromJson(doc.data(), doc.id)).toList();
    } catch (e) {
      // If ordering fails because index is not created yet, fallback to fetching and sorting locally
      try {
        final snapshot = await _firestore
            .collection('orders')
            .where('userId', isEqualTo: userId)
            .get();

        List<OrderModel> orders = snapshot.docs.map((doc) => OrderModel.fromJson(doc.data(), doc.id)).toList();
        orders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        return orders;
      } catch (innerError) {
        throw Exception('Failed to fetch orders: $innerError');
      }
    }
  }
}
