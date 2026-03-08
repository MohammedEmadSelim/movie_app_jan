import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/view/screens/fav_screen.dart';
import 'package:movie_app/view/screens/home_screen.dart';
import 'package:movie_app/view/screens/movie_details_screen.dart';
import 'package:movie_app/view/screens/nav_screen.dart';
import 'package:movie_app/view/screens/search_screen.dart';
import 'package:movie_app/view/screens/splashScreen.dart';
import 'package:movie_app/view_model/home_carousel_movies_cubit.dart';
import 'package:movie_app/view_model/movie_details_cubit.dart';
import 'package:movie_app/view_model/now_playing_cubit.dart';
import 'package:movie_app/view_model/search_cubit.dart';

class AppRouter {
  late HomeCarouselMoviesCubit homeCarouselMoviesCubit;
  late NowPlayingCubit nowPlayingCubit;
  late SearchCubit searchCubit;
  late MovieDetailsCubit movieDetailsCubit;

  AppRouter() {
    homeCarouselMoviesCubit = HomeCarouselMoviesCubit();
    nowPlayingCubit = NowPlayingCubit();
    searchCubit = SearchCubit();
    movieDetailsCubit = MovieDetailsCubit();
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
     case '/':
       return MaterialPageRoute(
         builder: (_) => Splashscreen(),
       );

      case '/home':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: homeCarouselMoviesCubit),
              BlocProvider.value(value: nowPlayingCubit),
            ],
            child:  HomeScreen(),
          ),
        );
      case '/nav':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: homeCarouselMoviesCubit),
              BlocProvider.value(value: nowPlayingCubit),
              BlocProvider.value(value: searchCubit),
            ],
            child: NavScreen(),
          ),
        );

      case '/details':
        final movie = settings.arguments as MovieModel;

        return MaterialPageRoute(
          builder: (_) => MovieDetailsScreen(movie: movie),
        );
      case '/search':
        final keyword = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: searchCubit,
            child: SearchScreen(keyword: keyword),
          ),
        );

      case '/watchlist':
        return MaterialPageRoute(
          builder: (_) => const FavScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No Route Found')),
          ),
        );
    }
  }
}