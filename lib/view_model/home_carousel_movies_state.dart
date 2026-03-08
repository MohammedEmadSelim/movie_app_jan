part of 'home_carousel_movies_cubit.dart';

@immutable
sealed class HomeCarouselMoviesState {}

final class HomeCarouselMoviesInitial extends HomeCarouselMoviesState {}

final class HomeCarouselMoviesLoading extends HomeCarouselMoviesState {}

final class HomeCarouselMoviesFailure extends HomeCarouselMoviesState {
  final String message;

  HomeCarouselMoviesFailure(this.message);
}

final class HomeCarouselMoviesSuccess extends HomeCarouselMoviesState {
  final CarouselMoviesResponse movies;

  HomeCarouselMoviesSuccess(this.movies);
}