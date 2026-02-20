import 'package:movies_station_app/domain/movie_details/use_cases/get_movie_cast_use_case.dart';
import 'package:movies_station_app/domain/movie_details/use_cases/get_movie_details_use_case.dart';
import 'package:movies_station_app/presentation/movie_details/cubit/movie_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_station_app/domain/movie_details/use_cases/get_movie_reviews_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieReviewsUseCase getMovieReviews;
  final GetMovieCastUseCase getMovieCast;
  final GetMovieDetailsUseCase getMovieDetails;

  MovieDetailsCubit(
    this.getMovieReviews,
    this.getMovieCast,
    this.getMovieDetails,
  ) : super(MovieDetailsInitial());

  Future<void> fetchMovieDetails(int movieId) async {
    emit(MovieDetailsLoading());

    try {
      final reviews = await getMovieReviews(movieId);
      final cast = await getMovieCast(movieId);
      final details = await getMovieDetails(movieId);

      emit(
        MovieDetailsLoaded(reviews: reviews, cast: cast, movieDetails: details),
      );
    } catch (e) {
      emit(MovieDetailsError(e.toString()));
    }
  }
}
