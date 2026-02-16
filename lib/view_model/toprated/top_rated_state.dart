part of 'top_rated_cubit.dart';

@immutable
sealed class TopRatedState {}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedLoading extends TopRatedState {

}

final class TopRatedSuccess extends TopRatedState {
  final TopRatedMovieModel topRatedMovie;
  TopRatedSuccess(this.topRatedMovie);
}

final class TopRatedError extends TopRatedState {
  final String message;
  TopRatedError(this.message);
}






