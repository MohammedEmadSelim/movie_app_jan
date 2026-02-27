import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';
import '/widgets/splash_logo_card.dart';
import 'main_layout.dart';
 class Splash extends StatefulWidget {
   const Splash({super.key});
 
   @override
   State<Splash> createState() => _SplashState();
 }
 
 class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {

   late AnimationController _controller;
   late Animation <double> _fadeAnimation;
   late Animation <double> _scaleAnimation;

   @override
   void initState() {
     super.initState();
     _controller = AnimationController(
       duration: const Duration(seconds: 3),
       vsync: this,
     );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  MainLayout()),
      );
    });
    }
    @override
   void dispose() {
     _controller.dispose();
     super.dispose();

   }
   Widget build(BuildContext context) {
     return SplashLogoCard(fadeAnimation: _fadeAnimation ,scaleAnimation:  _scaleAnimation );
   }
 }
 