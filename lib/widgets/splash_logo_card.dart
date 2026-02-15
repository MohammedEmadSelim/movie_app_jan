import 'package:flutter/material.dart';

class SplashLogoCard extends StatelessWidget {
  final Animation<double> _fadeAnimation;
  final Animation<double> _scaleAnimation;

   const SplashLogoCard({super.key,
     required Animation<double> fadeAnimation,
     required Animation<double> scaleAnimation}):_fadeAnimation = fadeAnimation ,
         _scaleAnimation = scaleAnimation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black38,
        body: Center(
            child: FadeTransition(opacity: _fadeAnimation,
              child: ScaleTransition(scale: _scaleAnimation,
                child: Image.asset('assets/images/logo.png',
                  width: 200,

                ),
              ),
            )
        )
    );;
  }
}
