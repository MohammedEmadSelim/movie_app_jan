import 'package:movies_station_app/presentation/movie_details/cubit/movie_details_cubit.dart';
import 'package:movies_station_app/presentation/movie_details/cubit/movie_details_state.dart';
import 'package:movies_station_app/presentation/movie_details/widgets/reviews_tab_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewsTab extends StatelessWidget {
  final int movieId;

  const ReviewsTab({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MovieDetailsError) {
          return Center(child: Text(state.message));
        }

        if (state is MovieDetailsLoaded) {
          final reviews = state.reviews;

          if (reviews.isEmpty) {
            return const Center(
              child: Text(
                "No reviews available",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: reviews.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return ReviewItem(review: reviews[index]);
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
