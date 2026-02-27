import 'package:flutter/material.dart';
import 'package:movies/screens/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/service.dart';


import 'cubit/movies_cubit.dart';
import 'cubit/watchlistcubit_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoviesCubit(Service())..getPopular(),
        ),
        BlocProvider(
          create: (context) => WatchlistCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

