import 'package:movies_station_app/core/utils/app_colors.dart';
import 'package:movies_station_app/presentation/movie_details/cubit/movie_details_cubit.dart';
import 'package:movies_station_app/presentation/movie_details/cubit/movie_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutMovieTab extends StatelessWidget {
  final int movieId;

  const AboutMovieTab({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MovieDetailsError) {
          return Text(
            state.message,
            style: const TextStyle(color: Colors.white),
          );
        }

        if (state is MovieDetailsLoaded) {
          final movie = state.movieDetails;

          return Text(
            movie.overview ?? "No description available",
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
