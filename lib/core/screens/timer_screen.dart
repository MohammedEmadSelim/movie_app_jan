import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/core/screens/splash_screen.dart';
import 'package:movie_app/models/cubit/search_cubit.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        //! this widget to make animation for transmission from page to page
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SplashScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            //! fadeTransmissin is the type of multiple types of animations.
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: Duration(milliseconds: 1500),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => SearchCubit(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/logo.png"),
              Gap(height * 0.01),
              FadeInUpBig(
                animate: true,
                delay: Duration(milliseconds: 100),

                child: const Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Lobster",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
