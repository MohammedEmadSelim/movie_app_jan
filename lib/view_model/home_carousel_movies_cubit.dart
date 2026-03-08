import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import '../models/carousel_movies.dart';

part 'home_carousel_movies_state.dart';

class HomeCarouselMoviesCubit extends Cubit<HomeCarouselMoviesState> {
  HomeCarouselMoviesCubit() : super(HomeCarouselMoviesInitial());

  Future<void> getHomeCarouselMovies() async {
    emit(HomeCarouselMoviesLoading());
    var dio = Dio();
    try {
      var res = await dio.get(
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc',
        options: Options(
          headers: {
            'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4',
            'accept': 'application/json',
          },
        ),
      );

      var data = CarouselMoviesResponse.fromJson(res.data);
      emit(HomeCarouselMoviesSuccess(data));
    } catch (e) {
      emit(HomeCarouselMoviesFailure(e.toString()));
    }
  }
}
