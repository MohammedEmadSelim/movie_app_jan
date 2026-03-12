
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/screens/splach.dart';
import 'component/custom_navigator.dart';
import 'models/movie_model.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieModelAdapter());
  await Hive.openBox<MovieModel>('movies');
  runApp(
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      title: 'Movie App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primary
      ),
      home:Splash(),
    );
  }
}

