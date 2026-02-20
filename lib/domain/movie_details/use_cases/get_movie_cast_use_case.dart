import 'package:movies_station_app/domain/movie_details/entities/cast_entity.dart';
import 'package:movies_station_app/domain/movie_details/repositories/movie_details_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMovieCastUseCase {
  final MovieDetailsRepo repo;

  GetMovieCastUseCase(this.repo);

  Future<List<CastEntity>> call(int movieId) {
    return repo.getMovieCast(movieId);
  }
}
