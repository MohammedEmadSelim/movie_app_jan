part of 'reviews_cubit.dart';

@immutable
sealed class ReviewsState {}

final class ReviewsInitial extends ReviewsState {}

final class ReviewsMovieLoading extends ReviewsState {}

final class ReviewsMovieSuccess extends ReviewsState {
  final ReviewsModel reviewsMovie;
  ReviewsMovieSuccess(this.reviewsMovie);
}

final class ReviewsMovieError extends ReviewsState {
  final String message;
  ReviewsMovieError(this.message);
}
