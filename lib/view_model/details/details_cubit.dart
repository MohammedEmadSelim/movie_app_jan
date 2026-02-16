import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../model/details/details_movie_model.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());
  
  Future<void>getDetailsMovie(int movieId)async{
    emit(DetailsMovieLoading());
    try{
      var dio=Dio();
      var det = await dio.get(
        'https://api.themoviedb.org/3/movie/$movieId?language=en-US',
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNDk1YmYyZmE2ODNmNzIwNjEzMTVkNGY1NTc1NzJlNiIsIm5iZiI6MTc3MDM5Mzc3Ni45NTYsInN1YiI6IjY5ODYxMGIwMDllNjg1NWVhZDk5ZDkwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.946IHLDHpq5yljpvLWhxc2kuRsxupSCoqZTtXumXQHc",
            "accept":"application/json"
          }
        )
      );
      final detailsMovie = DetailsMovieModel.fromJson(det.data);
      emit(DetailsMovieSuccess(detailsMovie));
    }catch(e){
      emit(DetailsMovieError(e.toString()));
    }
  }
}
