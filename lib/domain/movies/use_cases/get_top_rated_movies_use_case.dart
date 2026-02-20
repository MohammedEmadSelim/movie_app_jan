import '../entities/movie_entity.dart';
import '../repositories/movies_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTopRatedMoviesUseCase {
  final MoviesRepo repo;

  GetTopRatedMoviesUseCase(this.repo);

  Future<List<MovieEntity>> call() {
    return repo.getTopRatedMovies();
  }
}
