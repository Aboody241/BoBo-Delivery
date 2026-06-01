import 'package:bobo/core/consts/routes/routes.dart';
import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:bobo/services/firebase/auth_service.dart';
import 'package:bobo/controller/user/cubit/user_cubit.dart';
import 'package:bobo/controller/user/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 1,
      title: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading || state is UserInitial) {
            return const SizedBox(
              height: 40,
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            );
          }

          String userName = 'User';
          if (state is UserLoaded) {
            userName = state.user.name;
          }

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
                  Text('What are you craving?', style: AppTextStyle.poppins20),
                ],
              ),
              InkWell(
                onTap: () async {
                  await AuthService().logout();
                  if (!context.mounted) return;
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pushReplacementNamed(AppRoutes.onBoardingAuth);
                },
                child: const CircleAvatar(
                  maxRadius: 25,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.person, color: Colors.white, size: 28),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
