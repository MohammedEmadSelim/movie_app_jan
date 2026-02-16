part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class DetailsMovieLoading extends DetailsState {}

final class DetailsMovieSuccess extends DetailsState {
  final DetailsMovieModel detailsMovie;
  DetailsMovieSuccess(this.detailsMovie);
}

final class DetailsMovieError extends DetailsState {
  final String message;
  DetailsMovieError(this.message);
}
