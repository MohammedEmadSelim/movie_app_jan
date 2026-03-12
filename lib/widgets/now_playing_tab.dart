import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies_service/now_playing/now_playing_movie_cubit.dart';
import '../component/custome_text.dart';
import '../component/shimmer_grid.dart';

class NowPlayingTab extends StatelessWidget {
  const NowPlayingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMovieCubit , NowPlayingMovieState>(
        builder: (context , state){
          if(state is NowPlayingMovieLoading){
            return ShimmerSkeleton(count: 9);
          }

          if(state is NowPlayingMovieFailure){
            return CustomeText(text: state.message,size: 18,weigh: FontWeight.w500,);
          }

          if(state is NowPlayingMovieSuccess){
            var movies = state.nowPlayingResponse.results;
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  childAspectRatio: 2 / 3
                ),
                itemCount: movies.length,
                itemBuilder: (context , index){
                  return GestureDetector(
                    onTap: (){},
                    
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network("https://image.tmdb.org/t/p/w500/${movies[index].posterPath}",
                        width: 150, height: 200,
                        fit: BoxFit.cover,

                      ),
                    ),
                  );
                }
            );
          }
          return SizedBox();
        }
    )

    ;
  }
}
