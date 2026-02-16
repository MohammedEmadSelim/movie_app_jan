import 'package:flutter/material.dart';
import 'package:movies/view/screens/heart_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/view_model/cast/cast_cubit.dart';
import 'package:movies/view_model/details/details_cubit.dart';
import 'package:movies/view_model/nowplaying/now_playing_cubit.dart';
import 'package:movies/view_model/popular/popular_cubit.dart';
import 'package:movies/view_model/reviews/reviews_cubit.dart';
import 'package:movies/view_model/toprated/top_rated_cubit.dart';
import 'package:movies/view_model/upcoming/upcoming_cubit.dart';
import 'view_model/search_movie/search_movie_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TopRatedCubit(),
        ),
        BlocProvider(
          create: (context) => SearchMovieCubit(),
        ),
        BlocProvider(
            create: (context) => UpcomingCubit()),
        BlocProvider(
            create:(context) => PopularCubit()),
        BlocProvider(
            create:(context) => NowPlayingCubit()),
        BlocProvider(
            create: (context)=>ReviewsCubit()),
        BlocProvider(
            create:(context)=>CastCubit()),
        BlocProvider(
            create: (context)=>DetailsCubit())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movies', home: HeartScreen()),
    );
  }
}
