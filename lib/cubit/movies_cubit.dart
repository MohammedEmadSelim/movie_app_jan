import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/movie_model.dart';
import '../service/service.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {

  MoviesCubit(this.api) : super(MoviesInitial());

  final Service api;

  List<MovieModel> popularMovies = [];

  Future<void> getPopular() async {
    emit(MoviesLoading());
    try {
      popularMovies = await api.getPopularMovies();
      emit(MoviesSuccess(moviesList: popularMovies));
    } catch (e) {
      emit(MoviesError());
    }
  }
  Future<void> search(String query) async {
    emit(MoviesLoading());
    try {
      List<MovieModel> results = await api.searchMovies(query);
      emit(MoviesSuccess(moviesList: results));
    } catch (e) {
      emit(MoviesError());
    }
  }
}
