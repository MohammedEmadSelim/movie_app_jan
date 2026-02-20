import '../entities/movie_entity.dart';

abstract class MoviesRepo {
  Future<List<MovieEntity>> getTopRatedMovies();
  Future<List<MovieEntity>> getPopularMovies();
  Future<List<MovieEntity>> getUpcomingMovies();
  Future<List<MovieEntity>> getNowPlayingMovies();
  Future<List<MovieEntity>> searchMovies(String query);
}
