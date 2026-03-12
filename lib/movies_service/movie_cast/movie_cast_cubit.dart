import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../models/movie_cast-model.dart';

part 'movie_cast_state.dart';

class MovieCastCubit extends Cubit<MovieCastState> {
  MovieCastCubit() : super(MovieCastInitial());

  Future<void> getMovieCast(int id) async {
    var dio = Dio();
    try {
      emit(MovieCastLoading());
      var res = await dio.get(
        "https://api.themoviedb.org/3/movie/$id/credits?language=en-US",
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4",
            "accept": "application/json",
          },
        ),
      );
      var data = MovieCastModel.fromJson(res.data);
      emit(MovieCastSuccess(data));
    } catch (e) {
      emit(MovieCastFailure(e.toString()));
    }
  }
}
