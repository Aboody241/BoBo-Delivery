import 'package:bobo/core/consts/routes/routes.dart';
import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:bobo/services/firebase/auth_resvice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {

    final String uid = FirebaseAuth.instance.currentUser!.uid;
    final userRef = FirebaseFirestore.instance.collection('users').doc(uid);

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 1,
      title: FutureBuilder<DocumentSnapshot>(
        future: userRef.get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 40,
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            );
          }

          final userData = snapshot.data?.data() as Map<String, dynamic>? ?? {};
          final userName = userData['name'] ?? 'User';

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Hi $userName',
                    style: AppTextStyle.poppins18,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text('What are you carving?', style: AppTextStyle.poppins20),
                ],
              ),
              InkWell(
                onTap: () async {
                  await AuthService().logout();
                  if (!context.mounted) return;
                  Navigator.pushReplacementNamed(context, AppRoutes.mainNav);
                },
                child: CircleAvatar(
                  maxRadius: 25,
                  backgroundColor: Colors.blueAccent,
                  child: snapshot.hasData
                      ? Image.asset('assets/consts/avataar.jpeg')
                      : Icon(Icons.person, color: Colors.white, size: 28),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
