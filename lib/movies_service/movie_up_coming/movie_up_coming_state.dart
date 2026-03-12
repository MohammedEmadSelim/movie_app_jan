part of 'movie_up_coming_cubit.dart';

@immutable
sealed class MovieUpComingState {}

final class MovieUpComingInitial extends MovieUpComingState {}
final class MovieUpComingLoading extends MovieUpComingState {}

final class MovieUpComingFailure extends MovieUpComingState {
     final String message;
     MovieUpComingFailure(this.message);
}

final class MovieUpComingSuccess extends MovieUpComingState {
        final MoviesResponseUpComing movieUp;
        MovieUpComingSuccess(this.movieUp);
}

