import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_api_explain/models/movie_model.dart';
import 'package:new_api_explain/utlies/hive_boxes.dart';
import 'package:new_api_explain/view/screens/nav_screen.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(MovieModelAdapter());
  // open the box and pass the value to global Box
  moviesBox = await Hive.openBox<MovieModel>("fav_movies");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: NavScreen(),
    );
  }
}




