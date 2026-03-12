part of 'movie_cast_cubit.dart';

@immutable
sealed class MovieCastState {}

final class MovieCastInitial extends MovieCastState {}
final class MovieCastLoading extends MovieCastState {}

final class MovieCastFailure extends MovieCastState {
    final String message;
    MovieCastFailure(this.message);
}

final class MovieCastSuccess extends MovieCastState {
  final MovieCastModel movieCast;
  MovieCastSuccess(this.movieCast);
}

