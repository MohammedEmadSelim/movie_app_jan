part of 'movie_reviews_cubit.dart';

@immutable
sealed class MovieReviewsState {}

final class MovieReviewsInitial extends MovieReviewsState {}

final class MovieReviewsLoading extends MovieReviewsState {}

final class MovieReviewsFailure extends MovieReviewsState {
      final String message ;
      MovieReviewsFailure(this.message);
}

final class MovieReviewsSuccess extends MovieReviewsState {

  final ReviewResponse movieReview;
  MovieReviewsSuccess(this.movieReview);

}

