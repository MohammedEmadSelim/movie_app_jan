import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/screens/home_screen.dart';
import 'package:movie_app/core/theme/app_theme.dart';
//! package from flutter to make animation on text
import 'package:animate_do/animate_do.dart';
import 'package:movie_app/models/cubit/search_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SplashScreen> {
  final String welcomeText = " Discover Your Next Movie";

  final String buttonText = "Get Started";

  void onPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => SearchCubit(),
          child: const HomeScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.appTheme,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Spacer(),
                //! widget from animate_do package to make animation ont the text
                FadeInDownBig(
                  animate: true,
                  duration: Duration(seconds: 2),
                  delay: Duration(milliseconds: 500),
                  child: Text(
                    welcomeText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      fontFamily: "Lobster",
                    ),
                  ),
                ),
                const Spacer(),

                SizedBox(
                  height: height * 0.06,
                  width: width * 0.8,
                  child: FadeInUp(
                    animate: true,
                    duration: Duration(seconds: 2),
                    delay: Duration(milliseconds: 500),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appTheme,
                        animationDuration: Duration(seconds: 3),
                        shadowColor: Colors.white.withOpacity(0.9),
                        foregroundColor: AppColors.textFillTheme,
                      ),
                      onPressed: onPressed,
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: "Lobster",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
