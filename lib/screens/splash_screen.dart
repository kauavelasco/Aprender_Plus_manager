import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aprender_plus_manager/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late int splashDuration;

  @override
  void initState() {
    super.initState();
    _checkFirstRun();
  }

  Future<void> _checkFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstRun = prefs.getBool('isFirstRun') ?? true;

    splashDuration = isFirstRun ? 10 : 3;

    if (isFirstRun) {
      await prefs.setBool('isFirstRun', false);
    }

    Future.delayed(Duration(seconds: splashDuration), () {
      Navigator.push(
        // ignore: use_build_context_synchronously
        context, MaterialPageRoute(
          builder: (_) => LoginScreen()
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFEEEEEE),
              Color(0xFF9E9E9E),
              const Color(0xFF9E9E9E)
            ],
          ),
        ),
        child: Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}