import 'package:movies_station_app/core/constants/app_const.dart';
import 'package:movies_station_app/presentation/movie_details/cubit/movie_details_cubit.dart';
import 'package:movies_station_app/presentation/movie_details/cubit/movie_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CastTab extends StatelessWidget {
  final int movieId;
  const CastTab({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MovieDetailsError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.white),
            ),
          );
        }

        if (state is MovieDetailsLoaded) {
          final cast = state.cast;

          if (cast.isEmpty) {
            return const Center(
              child: Text(
                "No cast available",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;

              int crossAxisCount = 2;
              if (screenWidth > 600) crossAxisCount = 3;
              if (screenWidth > 900) crossAxisCount = 4;

              final avatarRadius = screenWidth / (crossAxisCount * 3.2);

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cast.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: screenWidth * 0.02,
                  crossAxisSpacing: screenWidth * 0.04,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final actor = cast[index];

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: avatarRadius,
                        backgroundColor: Colors.grey.shade800,
                        backgroundImage: actor.profilePath != null
                            ? NetworkImage(
                                "${AppConstants.imageBaseUrl}${actor.profilePath}",
                              )
                            : null,
                        child: actor.profilePath == null
                            ? const Icon(Icons.person, color: Colors.white)
                            : null,
                      ),
                      SizedBox(height: avatarRadius * 0.25),
                      Text(
                        actor.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: avatarRadius * 0.28,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: avatarRadius * 0.15),
                      Text(
                        actor.character,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: avatarRadius * 0.24,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
