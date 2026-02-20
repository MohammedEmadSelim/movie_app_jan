import 'package:movies_station_app/domain/movies/entities/movie_entity.dart';
import 'package:movies_station_app/domain/movies/repositories/movies_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchMoviesUseCase {
  final MoviesRepo repository;

  SearchMoviesUseCase(this.repository);

  Future<List<MovieEntity>> call(String query) {
    return repository.searchMovies(query);
  }
}
