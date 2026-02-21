// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ////////////////// LOGIN //////////////////
  Future<User?> loginUser(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Login Failed";
    }
  }

  ////////////////// REGISTER //////////////////
  Future<User?> registerUser(
    String email,
    String password,
  ) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

    

      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Register Failed";
    }
  }

  ////////////////// LOGOUT //////////////////
  Future<void> logout() async {
    await _auth.signOut();
  }

  ////////////////// CURRENT USER //////////////////
  User? get currentUser => _auth.currentUser;
}
