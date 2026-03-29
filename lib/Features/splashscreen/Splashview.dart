import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_resturant/Features/Home/widgets/root.dart';
import 'package:hungry_resturant/Features/auth/Screens/Sgin.dart';
import 'package:hungry_resturant/Features/auth/data/Cubit/auth_cubit.dart';
import 'package:hungry_resturant/Features/auth/data/Cubit/auth_state.dart';
import 'package:hungry_resturant/Theme/AppColor.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startApp();
  }

  Future<void> _startApp() async {
    // وقت السبلاتش
    await Future.delayed(const Duration(seconds: 2));

    // auto login
    final authCubit = context.read<AuthCubit>();
    await authCubit.autoLogin();

    if (!mounted) return;

    // القرار هنا
    if (authCubit.state is AuthSuccess) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Root()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Sgin()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "Media/Hungry_.png",
              width: 200,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "Media/Splash.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}