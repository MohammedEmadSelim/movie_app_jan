import '../model/movie_model.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getUpcomingMovies();
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> searchMovies(String query);
}
