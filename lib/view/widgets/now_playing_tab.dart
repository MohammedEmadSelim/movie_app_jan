import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/screens/movie_details_screen.dart';
import 'package:movie_app/view_model/now_playing_cubit.dart';
import 'package:movie_app/view_model/now_playing_state.dart';


class NowPlayingTab extends StatelessWidget {
  const NowPlayingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
      builder: (context, state) {
        if (state is NowPlayingLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is NowPlayingFailure) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
        }
        if (state is NowPlayingSuccess) {
          var movies = state.nowPlayingResponse.results;
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2 / 3,
            ),
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: movie.id,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        }
        // مش هيوصلها بس لازم تكون موجودة
        return const SizedBox();
      },
    );
  }
}

