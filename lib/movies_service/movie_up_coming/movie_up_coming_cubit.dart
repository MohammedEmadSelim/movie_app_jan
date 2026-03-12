import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../models/up_coming.dart';

part 'movie_up_coming_state.dart';

class MovieUpComingCubit extends Cubit<MovieUpComingState> {
  MovieUpComingCubit() : super(MovieUpComingInitial());
  
     Future <void> getMovieUpComing() async{
       var dio = Dio();
       try{
          var res = await dio.get("https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1",
            options: Options(
              headers:{
                "accept": "application/json",
                "Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4"
              }
            )
          );
           var data = MoviesResponseUpComing.fromJson(res.data);
           emit(MovieUpComingSuccess(data));
         
       }catch(e){
         emit(MovieUpComingFailure(e.toString()));
       }
     }
    
}
