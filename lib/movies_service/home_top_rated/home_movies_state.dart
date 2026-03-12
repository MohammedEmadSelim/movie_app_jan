part of 'home_movies_cubit.dart';

@immutable
sealed class HomeMoviesState {}

final class HomeMoviesInitial extends HomeMoviesState {}
final class HomeMoviesLoading extends HomeMoviesState {}
final class HomeMoviesFailure extends HomeMoviesState {
  final String message;
  HomeMoviesFailure(this.message);
}
final class HomeMoviesSuccess extends HomeMoviesState {
     final CarouselMoviesResponse movies;
     HomeMoviesSuccess(this.movies);
}

