import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_station_app/domain/movies/entities/movie_entity.dart';
import 'package:movies_station_app/domain/movie_details/use_cases/get_movie_details_use_case.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchListCubit extends Cubit<List<MovieEntity>> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  WatchListCubit(this.getMovieDetailsUseCase) : super([]);

  bool isInWatchList(int movieId) {
    return state.any((movie) => movie.id == movieId);
  }

  Future<void> toggleWatchList(MovieEntity movie) async {
    final isExist = isInWatchList(movie.id);

    if (isExist) {
      emit(state.where((m) => m.id != movie.id).toList());
    } else {
      emit([...state, movie]);

      final details = await getMovieDetailsUseCase(movie.id);

      updateMovieDetails(
        movieId: movie.id,
        genre: details.genres.isNotEmpty ? details.genres.first : null,
        runtime: details.runtime,
      );
    }
  }

  void updateMovieDetails({required int movieId, String? genre, int? runtime}) {
    final updatedList = state.map((movie) {
      if (movie.id == movieId) {
        return movie.copyWith(genre: genre, runtime: runtime);
      }
      return movie;
    }).toList();

    emit(updatedList);
  }
}
