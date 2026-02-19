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
      emit(MoviesSuccess());
    } catch (e) {
      emit(MoviesError());
    }
  }
}
