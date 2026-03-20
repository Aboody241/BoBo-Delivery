import 'dart:async';
import 'package:bobo/core/consts/routes/routes.dart';
import 'package:bobo/features/discover_page/pages/discover_screen.dart';
import 'package:bobo/features/home/pages/main_nav_screen.dart';
import 'package:bobo/features/splash/splash_screen.dart';
import 'package:bobo/features/auth/login/pages/login_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bobo/core/consts/theme/colors.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp();

      runApp(const MyApp());
    },
    (error, stackTrace) {
      debugPrint('Errorrrrrrrrrrr $error\n$stackTrace');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bobo App',

          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.lightGrey0,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.lightPrimary600,
              primary: AppColors.lightPrimary600,
              secondary: AppColors.lightPrimary200,
              surface: AppColors.lightGrey0,
              brightness: Brightness.light,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.lightGrey0,
              elevation: 0,
              scrolledUnderElevation: 0,
            ),
          ),

          darkTheme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.darkGrey0,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.darkPrimary600,
              primary: AppColors.darkPrimary600,
              secondary: AppColors.darkPrimary200,
              surface: AppColors.darkGrey0,
              brightness: Brightness.dark,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.darkGrey0,
              elevation: 0,
              scrolledUnderElevation: 0,
            ),
          ),

          themeMode: ThemeMode.system,

          // الصفحة الأولى
          home: const AuthGate(),

          // navigation routes
          onGenerateRoute: AppRoutes.generateRoute,

          // Error UI
          builder: (context, child) {
            ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
              return Scaffold(
                appBar: AppBar(title: const Text('حدث خطأ')),

                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'عذراً، حدث خطأ غير متوقع. الرجاء إعادة تشغيل التطبيق.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              );
            };
            return child!;
          },
        );
      },
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // أثناء تحميل Firebase
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }

        // المستخدم مسجل دخول
        if (snapshot.hasData) {
          return const MainNavScreen();
        }

        // المستخدم غير مسجل
        return const SplashScreen();
      },
    );
  }
}
