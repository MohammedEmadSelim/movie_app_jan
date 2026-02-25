part of 'cast_cubit.dart';

@immutable
sealed class CastState {}

final class CastInitial extends CastState {}

final class CastMovieLoading extends CastState {}

final class CastMovieSuccess extends CastState {
  final CastModel castMovie;
  CastMovieSuccess(this.castMovie);
}

final class CastMovieError extends CastState {
  final String message;
  CastMovieError(this.message);
}