import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_api_explain/view/screens/movie_details_screen.dart';
import 'package:new_api_explain/view_model/now_playing_cubit/now_playning_cubit.dart';

class NowPlayingTab extends StatelessWidget {
  const NowPlayingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
      builder: (context, state) {
        if(state is NowPlayingLoading){
          return Center(child: CircularProgressIndicator());
        }
        if(state is NowPlayingFailure){
          return Text(
            state.message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          );
        }
        if(state is NowPlayingSuccess){
          var movies = state.nowPlayingResponse.results;
          return GridView.builder(

            padding: EdgeInsets.all(10),
            itemCount:movies.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2 / 3,
            ),
            itemBuilder: (context, index) {

              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: movies[index]),));

                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500/${movies[index]
                        .posterPath}",                  height: 200,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        }
        return SizedBox();
      },
    );
  }
}

/// create bloc
/// create state
/// impl get func
/// convert data
/// put data  into ui
///
///
///
/// =====================
/// bloc provider
/// bloc builder
/// put data  into ui