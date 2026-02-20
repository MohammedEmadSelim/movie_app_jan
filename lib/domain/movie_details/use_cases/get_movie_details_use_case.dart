import 'package:movies_station_app/domain/movie_details/entities/movie_details_entity.dart';
import 'package:movies_station_app/domain/movie_details/repositories/movie_details_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMovieDetailsUseCase {
  final MovieDetailsRepo repo;

  GetMovieDetailsUseCase(this.repo);

  Future<MovieDetailsEntity> call(int movieId) {
    return repo.getMovieDetails(movieId);
  }
}
