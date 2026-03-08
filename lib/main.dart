import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart' show HiveX;
import 'package:movie_app/core/router/app_router.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/utlies/hive_boxes.dart' show moviesBox;



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();


  moviesBox = await Hive.openBox<MovieModel>('moviesBox');


  runApp( MovieApp());
}
class MovieApp extends StatelessWidget{
  MovieApp({super.key});
  AppRouter appRouter=AppRouter();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
   onGenerateRoute:appRouter.onGenerateRoute ,
      initialRoute: '/',
    );
  }
}
