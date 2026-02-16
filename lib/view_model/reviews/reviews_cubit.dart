import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movies/model/reviews/reviews_model.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit() : super(ReviewsInitial());
  
  Future<void>getReviewsMovie(int movieId)async{
    emit(ReviewsMovieLoading());
    try{
      var dio =Dio();
      var rev = await dio.get(
          'https://api.themoviedb.org/3/movie/$movieId/reviews?language=en-US&page=1',
          options: Options(
              headers: {
                "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNDk1YmYyZmE2ODNmNzIwNjEzMTVkNGY1NTc1NzJlNiIsIm5iZiI6MTc3MDM5Mzc3Ni45NTYsInN1YiI6IjY5ODYxMGIwMDllNjg1NWVhZDk5ZDkwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.946IHLDHpq5yljpvLWhxc2kuRsxupSCoqZTtXumXQHc",
                "accept":"application/json"
              }
          )
      );
      final reviewsMovie = ReviewsModel.fromJson(rev.data);
      emit(ReviewsMovieSuccess(reviewsMovie));
    }catch (e){
      emit(ReviewsMovieError(e.toString()));
    }

  }
}
