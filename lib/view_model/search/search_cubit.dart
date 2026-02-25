import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
//import 'package:movies/model/search/search_model.dart';

import '../../model/search/searchModel.dart';

part 'search_state.dart';

class SearchMovieCubit extends Cubit<SearchMovieState> {
  SearchMovieCubit() : super(SearchMovieInitial());

  Future<void> getSearchMovies (String keyWord)async{
    emit(SearchMovieLoading());
    try{
      var dio = Dio();
      var search = await dio.get(
          'https://api.themoviedb.org/3/search/movie?query=$keyWord&include_adult=false&language=en-US&page=1',
          options: Options(
              headers: {
                "accept":"application/json",
                "Authorization":"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNDk1YmYyZmE2ODNmNzIwNjEzMTVkNGY1NTc1NzJlNiIsIm5iZiI6MTc3MDM5Mzc3Ni45NTYsInN1YiI6IjY5ODYxMGIwMDllNjg1NWVhZDk5ZDkwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.946IHLDHpq5yljpvLWhxc2kuRsxupSCoqZTtXumXQHc"
              }
          )
      );
      final searchMovie = SearchMovieModel.fromJson(search.data);
      emit(SearchMovieSuccess(searchMovie));
    }catch(e){
      emit(SearchMovieError(e.toString()));
    }
  }
}