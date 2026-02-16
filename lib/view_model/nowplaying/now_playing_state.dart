part of 'now_playing_cubit.dart';

@immutable
sealed class NowPlayingState {}

final class NowPlayingInitial extends NowPlayingState {}

final class NowPlayingLoading extends NowPlayingState {}

final class NowPlayingSuccess extends NowPlayingState {
  final NowPlayingModel nowPlayingMovie;
  NowPlayingSuccess(this.nowPlayingMovie);
}

final class NowPlayingError extends NowPlayingState {
  final String message;
  NowPlayingError(this.message);
}
