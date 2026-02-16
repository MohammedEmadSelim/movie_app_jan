// ignore_for_file: unused_import
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constant/constantFiles/dio_helpers.dart';
import 'package:movie_app/core/screens/splash_screen.dart';
import 'package:movie_app/core/screens/home_screen.dart';
import 'package:movie_app/core/screens/timer_screen.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/models/cubit/search_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(scaffoldBackgroundColor: AppColors.appTheme),
      home: BlocProvider(
        create: (context) => SearchCubit(),
        child: TimerScreen(),
      ),
      routes: {
        "HomeScreen": (context) => HomeScreen(),

        "SplashScreen": (context) => SplashScreen(),
      },
    );
  }
}
