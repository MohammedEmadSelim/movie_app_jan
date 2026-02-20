import '../entities/movie_entity.dart';
import '../repositories/movies_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPopularMoviesUseCase {
  final MoviesRepo repo;

  GetPopularMoviesUseCase(this.repo);

  Future<List<MovieEntity>> call() {
    return repo.getPopularMovies();
  }
}
