part of 'upcoming_cubit.dart';

@immutable
sealed class UpcomingState {}

final class UpcomingInitial extends UpcomingState {}

final class UpcomingMovieInitial extends UpcomingState {}

final class UpcomingMovieLoading extends UpcomingState {}

final class UpcomingMovieSuccess extends UpcomingState {
  final UpcomingMovieModel upComingMovie;
  UpcomingMovieSuccess(this.upComingMovie);
}

final class UpcomingMovieError extends UpcomingState {
  final String message;
  UpcomingMovieError(this.message);
}