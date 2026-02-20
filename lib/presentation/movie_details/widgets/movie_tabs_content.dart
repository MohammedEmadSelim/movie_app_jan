import 'package:movies_station_app/presentation/movie_details/tabs/cast_tab.dart';
import 'package:movies_station_app/presentation/movie_details/tabs/reviews_tab.dart';
import 'package:flutter/material.dart';
import '../tabs/about_movie_tab.dart';

class MovieTabsContent extends StatelessWidget {
  final int currentTabIndex;
  final int movieId;

  const MovieTabsContent({
    super.key,
    required this.currentTabIndex,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    switch (currentTabIndex) {
      case 0:
        return AboutMovieTab(movieId: movieId);
      case 1:
        return ReviewsTab(movieId: movieId);
      case 2:
        return CastTab(movieId: movieId);
      default:
        return const SizedBox();
    }
  }
}
