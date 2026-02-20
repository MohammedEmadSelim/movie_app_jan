import '../entities/movie_entity.dart';
import '../repositories/movies_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUpComingMoviesUseCase {
  final MoviesRepo repo;

  GetUpComingMoviesUseCase(this.repo);

  Future<List<MovieEntity>> call() {
    return repo.getUpcomingMovies();
  }
}
