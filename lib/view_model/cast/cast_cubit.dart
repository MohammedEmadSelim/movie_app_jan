import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movies/model/cast/cast_model.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit() : super(CastInitial());

  Future<void> getCastMovie(int movieId)async{
    emit(CastMovieLoading());
    try{
      var dio =Dio();
      var cas = await dio.get(
          'https://api.themoviedb.org/3/movie/$movieId/credits?language=en-US',
          options: Options(
              headers: {
                "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNDk1YmYyZmE2ODNmNzIwNjEzMTVkNGY1NTc1NzJlNiIsIm5iZiI6MTc3MDM5Mzc3Ni45NTYsInN1YiI6IjY5ODYxMGIwMDllNjg1NWVhZDk5ZDkwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.946IHLDHpq5yljpvLWhxc2kuRsxupSCoqZTtXumXQHc",
                "accept":"application/json"
              }
          )
      );
      final castMovie= CastModel.fromJson(cas.data);
      emit(CastMovieSuccess(castMovie));
    }catch(e){
      emit(CastMovieError(e.toString()));
    }

  }
}
