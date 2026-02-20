import 'package:movies_station_app/domain/movie_details/entities/movie_details_entity.dart';

class MovieDetailsModel {
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;
  final int runtime;
  final List<String> genres;

  MovieDetailsModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.runtime,
    required this.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      posterPath: json['poster_path'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      releaseDate: json['release_date'] ?? '',
      runtime: json['runtime'] ?? 0,
      genres:
          (json['genres'] as List?)?.map((e) => e['name'] as String).toList() ??
          [],
    );
  }

  MovieDetailsEntity toEntity() {
    return MovieDetailsEntity(
      id: id,
      title: title,
      overview: overview,
      backdropPath: backdropPath,
      posterPath: posterPath,
      voteAverage: voteAverage,
      releaseDate: releaseDate,
      runtime: runtime,
      genres: genres,
    );
  }
}
