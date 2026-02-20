import '../entities/movie_entity.dart';
import '../repositories/movies_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetNowPLayingMoviesUseCase {
  final MoviesRepo repo;

  GetNowPLayingMoviesUseCase(this.repo);

  Future<List<MovieEntity>> call() {
    return repo.getNowPlayingMovies();
  }
}
