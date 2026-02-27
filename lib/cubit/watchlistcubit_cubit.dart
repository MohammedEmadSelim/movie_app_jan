import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/movie_model.dart';

part 'watchlistcubit_state.dart';

class WatchlistCubit extends Cubit<List<MovieModel>> {
  WatchlistCubit() : super([]);

  void toggle(MovieModel movie) {
    List<MovieModel> list = List.from(state);
    if (list.any((element) => element.id == movie.id)) {
      list.removeWhere((element) => element.id == movie.id);
    } else {
      list.add(movie);
    }
    emit(list);
  }
}