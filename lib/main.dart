// ignore_for_file: unused_import
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constant/constantFiles/dio_helpers.dart';
import 'package:movie_app/core/screens/search_screen.dart';
import 'package:movie_app/core/screens/splash_screen.dart';
import 'package:movie_app/core/screens/home_view.dart';
import 'package:movie_app/core/screens/timer_screen.dart';
import 'package:movie_app/core/screens/watch_list_screen.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/models/cubit/search_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //! call DioHelper when the the program start running
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.appTheme,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.appTheme,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.navCollorTheme,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(
            color: AppColors.navCollorTheme,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.white38,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: BlocProvider(
        create: (context) => SearchCubit(),
        child: SplashView(),
      ),
      routes: {
        "HomeScreen": (context) => HomeScreen(),
        "WatchListScreen": (context) => WatchListScreen(),
        "SplashScreen": (context) => SplashScreen(),
        "SearchScreen": (context) => SearchScreen(),
      },
    );
  }
}
