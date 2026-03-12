part of 'now_playing_movie_cubit.dart';

@immutable
sealed class NowPlayingMovieState {}

final class NowPlayingMovieInitial extends NowPlayingMovieState {}
final class NowPlayingMovieLoading extends NowPlayingMovieState {}

final class NowPlayingMovieFailure extends NowPlayingMovieState {
      final String message;
      NowPlayingMovieFailure(this.message);
}
final class NowPlayingMovieSuccess extends NowPlayingMovieState {
  final TmdbNowPlayingResponse nowPlayingResponse ;
  NowPlayingMovieSuccess(this.nowPlayingResponse);
}

