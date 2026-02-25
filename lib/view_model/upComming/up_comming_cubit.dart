import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../model/upComming/upCommingModel.dart';
//import 'package:movies/model/upcoming/upcoming_model.dart';

part 'up_comming_state.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  UpcomingCubit() : super(UpcomingInitial());

  Future<void> getUpcomingMovies()async{
    emit(UpcomingMovieLoading());
    try{
      var dio=Dio();
      var upCom = await dio.get(
          'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1',
          options: Options(
              headers: {
                "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNDk1YmYyZmE2ODNmNzIwNjEzMTVkNGY1NTc1NzJlNiIsIm5iZiI6MTc3MDM5Mzc3Ni45NTYsInN1YiI6IjY5ODYxMGIwMDllNjg1NWVhZDk5ZDkwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.946IHLDHpq5yljpvLWhxc2kuRsxupSCoqZTtXumXQHc",
                "accept":"application/json"
              }
          )
      );
      final upComingMovie = UpcomingMovieModel.fromJson(upCom.data);
      emit(UpcomingMovieSuccess(upComingMovie));
    } catch (e){
      emit(UpcomingMovieError(e.toString()));
    }
  }
}