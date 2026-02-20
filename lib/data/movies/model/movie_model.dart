import 'package:movies_station_app/domain/movies/entities/movie_entity.dart';

class MovieModel {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  MovieModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'] ?? '',
      overview: json['overview'] ?? '',
      voteAverage: (json['vote_average'] as num).toDouble(),
      releaseDate: json['release_date'] ?? '',
    );
  }

  MovieEntity toEntity() {
    return MovieEntity(
      id: id,
      title: title,
      posterPath: posterPath,
      overview: overview,
      voteAverage: voteAverage,
      releaseDate: releaseDate,
    );
  }
}
