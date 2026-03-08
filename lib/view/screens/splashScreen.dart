import 'dart:async';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context,  '/nav');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF242A32),
      body: Center(
        child: Image.asset(
          'assets/images/ce9b5bc57c376bf0cc505dabc5a7efd057658f6e.png',
          width: 180,
        ),
      ),
    );
  }
}