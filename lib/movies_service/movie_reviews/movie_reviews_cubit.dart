import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../models/movie_review.dart';

part 'movie_reviews_state.dart';

class MovieReviewsCubit extends Cubit<MovieReviewsState> {
  MovieReviewsCubit() : super(MovieReviewsInitial());

  Future<void> getMovieReviews(int id) async {
    var dio = Dio();
    try {
      emit(MovieReviewsLoading());

      var res = await dio.get(
        "https://api.themoviedb.org/3/movie/$id/reviews?language=en-US&page=1",
        options: Options(
          headers: {
            "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4",
            "accept": "application/json"
          },
        ),
      );

      var data = ReviewResponse.fromJson(res.data);
      emit(MovieReviewsSuccess(data)); // هنا صح
    } catch (e) {
      emit(MovieReviewsFailure(e.toString()));
    }
  }
}
