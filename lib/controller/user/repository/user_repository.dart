import 'package:bobo/controller/user/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseFirestore _firestore;

  UserRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<UserModel?> getUser(String uid, String fallbackEmail) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();

      if (doc.exists && doc.data() != null) {
        return UserModel.fromFirestore(doc.data()!, uid);
      }
      
      // If user doc doesn't exist, return a default model with email
      return UserModel(
        uid: uid,
        name: 'User',
        email: fallbackEmail,
        phoneCode: '',
        phoneNumber: '',
        birthday: '',
        address: '',
      );
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }

  Future<void> saveUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.uid).set(
        user.toFirestore(),
        SetOptions(merge: true),
      );
    } catch (e) {
      throw Exception('Failed to save user data: $e');
    }
  }
}
