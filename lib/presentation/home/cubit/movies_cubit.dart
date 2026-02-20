import 'package:movies_station_app/domain/movies/use_cases/get_now_playing_movies_use_case.dart';
import 'package:movies_station_app/domain/movies/use_cases/get_popular_movies_use_case.dart';
import 'package:movies_station_app/domain/movies/use_cases/get_upcoming_movies_use_case.dart';
import 'package:movies_station_app/presentation/home/cubit/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_station_app/core/errors/failure.dart';
import 'package:movies_station_app/domain/movies/use_cases/get_top_rated_movies_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class MoviesCubit extends Cubit<MoviesState> {
  final GetNowPLayingMoviesUseCase getNowPlaying;
  final GetUpComingMoviesUseCase getUpcoming;
  final GetTopRatedMoviesUseCase getTopRated;
  final GetPopularMoviesUseCase getPopular;

  MoviesCubit(
    this.getNowPlaying,
    this.getUpcoming,
    this.getTopRated,
    this.getPopular,
  ) : super(MoviesInitial());

  Future<void> fetchHomeMovies() async {
    emit(MoviesLoading());

    try {
      final nowPlayingMovies = await getNowPlaying();
      final upcomingMovies = await getUpcoming();
      final topRatedMovies = await getTopRated();
      final popularMovies = await getPopular();

      emit(
        MoviesLoaded(
          nowPlaying: nowPlayingMovies,
          upcoming: upcomingMovies,
          topRated: topRatedMovies,
          popular: popularMovies,
        ),
      );
    } on Failure catch (e) {
      emit(MoviesError(e.message));
    }
  }
}
