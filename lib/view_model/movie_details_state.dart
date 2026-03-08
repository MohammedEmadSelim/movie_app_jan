part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}
final class MovieDetailsLoading extends MovieDetailsState {}
final class MovieDetailsFailure extends MovieDetailsState {
  final String message;
  MovieDetailsFailure(this.message);
}
final class MovieDetailsSuccess extends MovieDetailsState {
   final MovieDetailsModel response;
   MovieDetailsSuccess(this.response);


}
