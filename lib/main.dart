import 'package:movies_station_app/core/di/di.dart';
import 'package:movies_station_app/core/routing/app_routes.dart';
import 'package:movies_station_app/domain/movies/entities/movie_entity.dart';
import 'package:movies_station_app/presentation/home/cubit/movies_cubit.dart';
import 'package:movies_station_app/presentation/home/cubit/watch_list_cubit.dart';

import 'package:movies_station_app/presentation/home/screens/home_screen.dart';
import 'package:movies_station_app/presentation/home/screens/splash_screen.dart';
import 'package:movies_station_app/presentation/movie_details/screens/movie_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/movie_details/cubit/movie_details_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => getIt<WatchListCubit>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Films App',
        initialRoute: AppRoutes.splashScreen,
        routes: {
          AppRoutes.splashScreen: (_) => const SplashScreen(),

          AppRoutes.homeScreen: (_) => BlocProvider(
            create: (_) => getIt<MoviesCubit>()..fetchHomeMovies(),
            child: const HomeScreen(),
          ),

          AppRoutes.movieDetailsScreen: (context) {
            final movie =
                ModalRoute.of(context)!.settings.arguments as MovieEntity;

            return BlocProvider(
              create: (_) =>
                  getIt<MovieDetailsCubit>()..fetchMovieDetails(movie.id),
              child: MovieDetailsScreen(movie: movie),
            );
          },
        },
      ),
    );
  }
}
