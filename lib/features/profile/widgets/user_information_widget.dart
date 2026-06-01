import 'package:bobo/core/consts/theme/colors.dart';
import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    final userRef = FirebaseFirestore.instance.collection('users').doc(uid);

    return FutureBuilder(
      future: userRef.get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 40,
            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        }
          final userData = snapshot.data?.data() as Map<String, dynamic>? ?? {};
          final userName = userData['nem'] ?? userData['name'] ?? 'User';
          final userEmail = userData['email'] ?? FirebaseAuth.instance.currentUser?.email ?? 'user@example.com';

        return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(1000),
            child: Image.asset(
              'assets/consts/avataar.jpeg',
              fit: BoxFit.fill,
              width: 100,
              height: 100,
            ),
          ),
          Gap(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: AppTextStyle.poppins22Bold),
              Gap(3),
              Text(
                userEmail,
                style: AppTextStyle.poppins12.copyWith(
                  color: AppColors.darkGrey300,
                ),
              ),
              Gap(10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star_rounded, color: AppColors.lightYellow),
                    Gap(5),
                    Text(
                      'Permium',
                      style: AppTextStyle.poppins14.copyWith(
                        color: AppColors.darkGrey200,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
      },
    );
  }
}



