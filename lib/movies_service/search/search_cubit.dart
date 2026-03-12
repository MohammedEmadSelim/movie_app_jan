import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/models/searchs.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  Future<void> getValueSearch({required String query}) async {
    var dio = Dio();
    try {
      emit(SearchLoading());

      var res = await dio.get(
        "https://api.themoviedb.org/3/search/movie",
        queryParameters: {
          "query": query,
          "include_adult": "false",
          "language": "en-US",
          "page": 1,
        },
        options: Options(
          headers: {
            "accept": "application/json",
            "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4"
          },
        ),
      );

      var data = MovieSearchResponseModel.fromJson(res.data);

      emit(SearchSuccess(data));
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }
}
