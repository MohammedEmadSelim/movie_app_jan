import 'package:flutter/material.dart';
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
          return const Center(child: CircularProgressIndicator());
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
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error, color: Colors.white),
                ),
              );
            },
          );
        }

        return const Center(
          child: Text(
            "No movies found",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}