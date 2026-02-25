import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../model/popular/popularModel.dart';
//import 'package:movies/model/popular/popular_model.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());
  Future<void> getPopularMovie()async{
    emit(PopularMovieLoading());
    try{
      var dio = Dio();
      var pop = await dio.get(
          'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1',
          options: Options(
              headers: {
                "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNDk1YmYyZmE2ODNmNzIwNjEzMTVkNGY1NTc1NzJlNiIsIm5iZiI6MTc3MDM5Mzc3Ni45NTYsInN1YiI6IjY5ODYxMGIwMDllNjg1NWVhZDk5ZDkwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.946IHLDHpq5yljpvLWhxc2kuRsxupSCoqZTtXumXQHc",
                "accept":"application/json"
              }
          )
      );
      final popularMovie = PopularMovieModel.fromJson(pop.data);
      emit(PopularMovieSuccess(popularMovie));
    }catch(e){
      emit(PopularMovieError(e.toString()));
    }

  }
}