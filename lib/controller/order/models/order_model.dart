import 'package:cloud_firestore/cloud_firestore.dart';

class OrderItem {
  final String productId;
  final String name;
  final String price;
  final String quantity;
  final String imageUrl;

  OrderItem({
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['productId'] ?? '',
      name: json['name'] ?? '',
      price: json['price']?.toString() ?? '0',
      quantity: json['quantaty']?.toString() ?? json['quantity']?.toString() ?? '1', // Support both spellings
      imageUrl: json['imageUrl'] ?? 'assets/products/o_pizza.png', // Fallback for UI
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'name': name,
      'price': price,
      'quantaty': quantity, // Matches DB screenshot
      'imageUrl': imageUrl,
    };
  }
}

class OrderModel {
  final String orderId;
  final String userId;
  final List<OrderItem> items;
  final String total;
  final String status;
  final DateTime createdAt;

  OrderModel({
    required this.orderId,
    required this.userId,
    required this.items,
    required this.total,
    required this.status,
    required this.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json, String documentId) {
    var itemsList = json['items'] as List? ?? [];
    List<OrderItem> parsedItems = itemsList.map((item) => OrderItem.fromJson(item)).toList();

    return OrderModel(
      orderId: json['orderId'] ?? documentId,
      userId: json['userId'] ?? '',
      items: parsedItems,
      total: json['total']?.toString() ?? '0',
      status: json['status'] ?? 'pending',
      createdAt: json['craateAt'] != null 
          ? (json['craateAt'] as Timestamp).toDate() 
          : (json['createdAt'] != null ? (json['createdAt'] as Timestamp).toDate() : DateTime.now()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'userId': userId,
      'items': items.map((item) => item.toJson()).toList(),
      'total': total,
      'status': status,
      'craateAt': Timestamp.fromDate(createdAt), // Matches DB screenshot
    };
  }
}
