import 'package:movies_station_app/domain/movie_details/entities/review_entity.dart';
import 'package:movies_station_app/domain/movie_details/repositories/movie_details_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMovieReviewsUseCase {
  final MovieDetailsRepo repo;

  GetMovieReviewsUseCase(this.repo);

  Future<List<ReviewEntity>> call(int movieId) {
    return repo.getMovieReviews(movieId);
  }
}
