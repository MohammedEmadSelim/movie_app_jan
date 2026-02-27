import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../service/api_constants.dart';
import '../cubit/movies_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoading) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 3,
            itemBuilder: (context, index) => Shimmer.fromColors(
              baseColor: Colors.grey[800]!,
              highlightColor: Colors.grey[700]!,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          );
        }

        if (state is MoviesSuccess) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: state.moviesList.length,
            itemBuilder: (context, index) {
              final movie = state.moviesList[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "${ApiConstants.imageBaseUrl}${movie.image}",
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        }

        return const Center(
          child: Text("Error loading movies", style: TextStyle(color: Colors.white)),
        );
      },
    );
  }
}